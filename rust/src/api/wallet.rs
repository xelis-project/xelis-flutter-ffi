use std::collections::{HashMap, HashSet};
use std::fmt::Debug;
use std::fs::File;
use std::path::Path;
use std::sync::Arc;
use std::thread;

use anyhow::{anyhow, bail, Context, Result};
use flutter_rust_bridge::frb;
use log::{debug, error, info, warn, trace};
use parking_lot::{Mutex, RwLock};
use serde::{Deserialize, Serialize};
use serde_json::json;
use xelis_common::api::{DataElement, DataValue};
use xelis_common::asset::{AssetData};
use xelis_common::config::{COIN_DECIMALS, XELIS_ASSET};
use xelis_common::crypto::{Address, Hash, Hashable};
use xelis_common::network::Network;
use xelis_common::serializer::Serializer;
use xelis_common::transaction::BurnPayload;
pub use xelis_common::transaction::builder::{FeeBuilder, TransactionTypeBuilder, TransferBuilder};
pub use xelis_common::transaction::Transaction;
use xelis_common::utils::{format_coin, format_xelis};
use xelis_wallet::precomputed_tables;
use xelis_wallet::wallet::{RecoverOption, Wallet};
pub use precomputed_tables::PrecomputedTablesShared;
pub use xelis_wallet::transaction_builder::TransactionBuilderState;

use crate::api::table_generation::LogProgressTableGenerationReportFunction;
use crate::frb_generated::StreamSink;

use lru::LruCache;
use std::num::NonZeroUsize;

macro_rules! ffi_entry {
    ($func_name:expr) => {{
        let start_time = std::time::Instant::now();
        let thread_id = std::thread::current().id();
        trace!("FFI_ENTRY: {} on thread {:?}", $func_name, thread_id);
        (start_time, thread_id)
    }};
}

macro_rules! ffi_exit {
    ($func_name:expr, $start_time:expr, $thread_id:expr) => {{
        let duration = $start_time.elapsed();
        trace!("FFI_EXIT: {} on thread {:?} - took {:?}", $func_name, $thread_id, duration);
    }};
}

#[derive(Serialize, Deserialize, Clone, Debug)]
#[frb(dart_metadata=("freezed"))]
pub struct SummaryTransaction {
    pub hash: String,
    pub fee: u64,
    pub transaction_type: TransactionTypeBuilder,
}

#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct XelisAssetOwner {
    pub contract: String,
    pub id: u64,
}

#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct XelisAssetMetadata {
    pub name: String,
    pub ticker: String,
    pub decimals: u8,
    pub max_supply: u64,
    pub owner: Option<XelisAssetOwner>,
}

#[derive(Clone, Debug)]
pub struct Transfer {
    pub float_amount: f64,
    pub str_address: String,
    pub asset_hash: String,
    pub extra_data: Option<String>,
}

pub struct XelisWallet {
    wallet: Arc<Wallet>,
    pending_transactions: RwLock<HashMap<Hash, (Transaction, TransactionBuilderState)>>,
}

// Precomputed tables for the wallet
static CACHED_TABLES: Mutex<Option<PrecomputedTablesShared>> = Mutex::new(None);

// Static cache for thread/concurrency parameters
static MT_PARAMS: Mutex<Option<(usize, usize)>> = Mutex::new(None);

// Static LRU cache for asset data - stores up to 10 assets
static ASSET_DATA_CACHE: Mutex<Option<LruCache<Hash, (AssetData, std::time::Instant)>>> = Mutex::new(None);
const ASSET_CACHE_TTL_SECS: u64 = 300;

#[frb(sync)]
pub fn get_cached_table() -> Option<PrecomputedTablesShared> {
    let guard = CACHED_TABLES.lock();
    guard.clone()
}

#[frb(sync)]
pub fn drop_wallet(wallet: XelisWallet) {
    drop(wallet);
}

fn get_mt_params() -> (usize, usize) {
    let mut guard = MT_PARAMS.lock();
    
    if let Some(params) = *guard {
        return params;
    }
    
    let cpu_cores = thread::available_parallelism().map(|p| p.get()).unwrap_or(1);
    let thread_count = (cpu_cores - 2).max(1).min(32);
    let concurrency = thread_count * 4;
    
    *guard = Some((thread_count, concurrency));
    
    (thread_count, concurrency)
}

// Initialize the cache if not already done
fn init_asset_cache() {
    let mut cache_guard = ASSET_DATA_CACHE.lock();
    if cache_guard.is_none() {
        let cache = LruCache::new(NonZeroUsize::new(10).unwrap());
        *cache_guard = Some(cache);
    }
}

// Clear the asset cache
#[frb(sync)]
pub fn clear_asset_cache() {
    if let Some(cache) = ASSET_DATA_CACHE.lock().as_mut() {
        cache.clear();
    }
}

// Get the size of the asset cache
#[frb(sync)]
pub fn get_asset_cache_size() -> usize {
    ASSET_DATA_CACHE.lock()
        .as_ref()
        .map(|cache| cache.len())
        .unwrap_or(0)
}

#[frb(sync)]
pub fn refresh_mt_params() {
    *MT_PARAMS.lock() = None;
    let _ = get_mt_params();
}

#[frb(sync)]
pub fn set_mt_params(thread_count: usize, concurrency: usize) {
    *MT_PARAMS.lock() = Some((thread_count, concurrency));
}

pub async fn create_xelis_wallet(
    name: String,
    directory: String,
    password: String,
    network: Network,
    seed: Option<String>,
    private_key: Option<String>,
    precomputed_tables_path: Option<String>,
    l1_size: Option<usize>
) -> Result<XelisWallet> {
    let full_path = Path::new(&directory).join(&name).to_string_lossy().to_string();
    let precomputed_tables_size = if cfg!(target_arch = "wasm32") || l1_size.is_none()
        { precomputed_tables::L1_LOW } else { l1_size.unwrap() };

    let precomputed_tables = {
        let tables = CACHED_TABLES.lock().clone();
        match tables {
            Some(tables) => tables,
            None => {
                let tables = precomputed_tables::read_or_generate_precomputed_tables(
                    precomputed_tables_path.as_deref(),
                    precomputed_tables_size,
                    LogProgressTableGenerationReportFunction,
                    true,
                )
                .await?;

                // It is done in two steps to avoid the "Future is not Send" error
                CACHED_TABLES.lock().replace(tables.clone());
                tables
            }
        }
    };

    let recover: Option<RecoverOption> = if let Some(seed) = seed.as_deref() {
        Some(RecoverOption::Seed(seed))
    } else if let Some(private_key) = private_key.as_deref() {
        Some(RecoverOption::PrivateKey(private_key))
    } else {
        None
    };

    let (thread_count, concurrency) = get_mt_params();
    let xelis_wallet = Wallet::create(&full_path, &password, recover, network, precomputed_tables, thread_count, concurrency).await?;
    Ok(XelisWallet {
        wallet: xelis_wallet,
        pending_transactions: RwLock::new(HashMap::new()),
    })
}

// for overwriting tables to update the memory footprint/decryption speed tradeoff
pub async fn update_tables(
    precomputed_tables_path: String,
    l1_size: Option<usize>
) -> Result<()> {
    let precomputed_tables_size = if cfg!(target_arch = "wasm32") || l1_size.is_none()
        { precomputed_tables::L1_LOW } else { l1_size.unwrap() };

    let tables = precomputed_tables::read_or_generate_precomputed_tables(
        Some(&precomputed_tables_path),
        precomputed_tables_size,
        LogProgressTableGenerationReportFunction,
        true,
    )
    .await?;

    // It is done in two steps to avoid the "Future is not Send" error
    CACHED_TABLES.lock().replace(tables.clone());
    Ok(())
}

pub async fn open_xelis_wallet(
    name: String,
    directory: String,
    password: String,
    network: Network,
    precomputed_tables_path: Option<String>,
    l1_size: Option<usize>
) -> Result<XelisWallet> {
    let full_path = Path::new(&directory).join(&name).to_string_lossy().to_string();

    let precomputed_tables_size = if cfg!(target_arch = "wasm32") || l1_size.is_none()
        { precomputed_tables::L1_LOW } else { l1_size.unwrap() };

    let precomputed_tables = precomputed_tables::read_or_generate_precomputed_tables(
        precomputed_tables_path.as_deref(),
        precomputed_tables_size,
        LogProgressTableGenerationReportFunction,
        true,
    )
    .await?;

    let (thread_count, concurrency) = get_mt_params();
    let xelis_wallet = Wallet::open(&full_path, &password, network, precomputed_tables, thread_count, concurrency)?;
    Ok(XelisWallet {
        wallet: xelis_wallet,
        pending_transactions: RwLock::new(HashMap::new()),
    })
}

impl XelisWallet {
    // Change the wallet password
    pub async fn change_password(&self, old_password: String, new_password: String) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("change_password");
        let result = self.wallet.set_password(&old_password, &new_password).await;
        ffi_exit!("change_password", start_time, thread_id);
        result
    }

    // set the wallet to online mode
    pub async fn online_mode(&self, daemon_address: String) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("online_mode");
        let result = self.wallet.set_online_mode(&daemon_address, true).await;
        ffi_exit!("online_mode", start_time, thread_id);
        Ok(result?)
    }

    // set the wallet to offline mode
    pub async fn offline_mode(&self) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("offline_mode");
        let result = self.wallet.set_offline_mode().await;
        ffi_exit!("offline_mode", start_time, thread_id);
        Ok(result?)
    }

    // Check if the wallet is online
    #[frb]
    pub async fn is_online(&self) -> bool {
        let (start_time, thread_id) = ffi_entry!("is_online");
        let result = self.wallet.is_online().await;
        ffi_exit!("is_online", start_time, thread_id);
        result
    }

    // Get the wallet address as a string
    #[frb(sync)]
    pub fn get_address_str(&self) -> String {
        let (start_time, thread_id) = ffi_entry!("get_address_str");
        let result = self.wallet.get_address().to_string();
        ffi_exit!("get_address_str", start_time, thread_id);
        result
    }

    // get the wallet network
    #[frb(sync)]
    pub fn get_network(&self) -> String {
        let (start_time, thread_id) = ffi_entry!("get_network");
        let result = self.wallet.get_network().to_string();
        ffi_exit!("get_network", start_time, thread_id);
        result
    }

    // close securely the wallet
    pub async fn close(&self) {
        let (start_time, thread_id) = ffi_entry!("close");
        clear_asset_cache();
        self.wallet.close().await;
        ffi_exit!("close", start_time, thread_id);
    }

    // get the wallet mnemonic seed in different languages
    pub async fn get_seed(&self, language_index: Option<usize>) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("get_seed");
        let index = language_index.unwrap_or_default();
        let result = self.wallet.get_seed(index);
        ffi_exit!("get_seed", start_time, thread_id);
        result
    }

    // get the wallet nonce
    pub async fn get_nonce(&self) -> u64 {
        let (start_time, thread_id) = ffi_entry!("get_nonce");
        let result = self.wallet.get_nonce().await;
        ffi_exit!("get_nonce", start_time, thread_id);
        result
    }

    // check if the password is valid
    pub async fn is_valid_password(&self, password: String) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("is_valid_password");
        let result = self.wallet.is_valid_password(&password).await;
        ffi_exit!("is_valid_password", start_time, thread_id);
        result
    }

    // Check if the asset is tracked
    pub async fn is_asset_tracked(&self, asset: String) -> Result<bool> {
        let (start_time, thread_id) = ffi_entry!("is_asset_tracked");
        let asset_hash = Hash::from_hex(&asset).context("Invalid assetID")?;

        let storage = self.wallet.get_storage().read().await;
        let result = storage.is_asset_tracked(&asset_hash);
        ffi_exit!("is_asset_tracked", start_time, thread_id);
        result
    }

    // Mark the requested asset as tracked
    pub async fn track_asset(&self, asset: String) -> Result<bool> {
        let (start_time, thread_id) = ffi_entry!("track_asset");
        debug!("TRACK IS CALLED");
        let asset_hash = Hash::from_hex(&asset).context("Invalid assetID")?;

        debug!("WAITING FOR INTERNAL");
        let result = self.wallet.track_asset(asset_hash).await
            .map_err(|e| anyhow::anyhow!("Failed to track asset: {}", e));
        ffi_exit!("track_asset", start_time, thread_id);
        result
    }

    // Unmark the requested asset from being tracked
    pub async fn untrack_asset(&self, asset: String) -> Result<bool> {
        let (start_time, thread_id) = ffi_entry!("untrack_asset");
        let asset_hash = Hash::from_hex(&asset).context("Invalid assetID")?;

        let result = self.wallet.untrack_asset(asset_hash).await
            .map_err(|e| anyhow::anyhow!("Failed to untrack asset: {}", e));
        ffi_exit!("untrack_asset", start_time, thread_id);
        result
    }

    // check if the wallet has a Xelis balance
    pub async fn has_xelis_balance(&self) -> Result<bool> {
        let (start_time, thread_id) = ffi_entry!("has_xelis_balance");
        let storage = self.wallet.get_storage().read().await;
        let result = storage.has_balance_for(&XELIS_ASSET).await;
        ffi_exit!("has_xelis_balance", start_time, thread_id);
        result
    }

    // get the wallet Xelis balance
    pub async fn get_xelis_balance(&self) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("get_xelis_balance");
        let storage = self.wallet.get_storage().read().await;
        let balance = storage
            .get_plaintext_balance_for(&XELIS_ASSET)
            .await
            .unwrap_or(0);
        let result = Ok(format_xelis(balance));
        ffi_exit!("get_xelis_balance", start_time, thread_id);
        result
    }

    // get the wallet Xelis balance, unformatted
    pub async fn get_xelis_balance_raw(&self) -> Result<u64> {
        let (start_time, thread_id) = ffi_entry!("get_xelis_balance_raw");
        let storage = self.wallet.get_storage().read().await;
        let balance = storage
            .get_plaintext_balance_for(&XELIS_ASSET)
            .await
            .unwrap_or(0);

        let result = Ok(balance);
        ffi_exit!("get_xelis_balance_raw", start_time, thread_id);
        result
    }

    // get all asset IDs present in wallet, independent from storage+balance information
    pub async fn get_all_assets(&self) -> Result<Vec<(String, XelisAssetMetadata)>> {
        let (start_time, thread_id) = ffi_entry!("get_all_assets");
        let storage = self.wallet.get_storage().read().await;
        let mut assets = Vec::new();

        for res in storage.get_assets_with_data().await? {
            match res {
                Ok((asset, data)) => {
                    let owner_wrapper = data.get_owner().clone().map(|owner| XelisAssetOwner {
                        contract: owner.get_contract().to_hex(),
                        id: owner.get_id(),
                    });

                    assets.push((
                        asset.to_string(),
                        XelisAssetMetadata {
                            name: data.get_name().to_string(),
                            ticker: data.get_ticker().to_string(),
                            decimals: data.get_decimals(),
                            max_supply: data.get_max_supply().unwrap_or(u64::MAX),
                            owner: owner_wrapper,
                      }));
                },
                Err(err) => {
                    debug!("Error in get_all_assets: {}", err);
                }
            }
        }

        let result = Ok(assets);
        ffi_exit!("get_all_assets", start_time, thread_id);
        result
    }

    // get all the asset balances in a HashMap
    pub async fn get_asset_balances(&self) -> Result<HashMap<String, String>> {
        let (start_time, thread_id) = ffi_entry!("get_asset_balances");
        let storage = self.wallet.get_storage().read().await;
        let mut balances = HashMap::new();

        for res in storage.get_assets_with_data().await? {
            match res {
                Ok((asset, data)) => {
                    if !storage.is_asset_tracked(&asset)? {
                        continue;
                    }
                    match storage.get_balance_for(&asset).await {
                        Ok(balance) => {
                            balances.insert(
                                asset.to_string(),
                                format_coin(balance.amount, data.get_decimals()),
                            );
                        }
                        Err(err) => {
                            debug!("Error with asset balance data entry for asset {}: {}", asset, err);
                            balances.insert(
                                asset.to_string(),
                                format_xelis(0),
                            );
                        }
                    }
                },
                Err(err) => {
                    debug!("Error in get_asset_balances: {}", err);
                }
            }
        }
        let result = Ok(balances);
        ffi_exit!("get_asset_balances", start_time, thread_id);
        result
    }

    // get all the tracked asset balances (atomic units) in a HashMap, unformatted
    pub async fn get_tracked_asset_balances_raw(&self) -> Result<HashMap<String, u64>> {
        let (start_time, thread_id) = ffi_entry!("get_tracked_asset_balances_raw");
        let storage = self.wallet.get_storage().read().await;
        let mut balances = HashMap::new();

        let tracked_assets = storage.get_tracked_assets()?;
        
        for asset_result in tracked_assets {
            let asset = asset_result?;
            match storage.get_balance_for(&asset).await {
                Ok(balance) => {
                    balances.insert(
                        asset.to_string(),
                        balance.amount,
                    );
                }
                Err(err) => {
                    debug!("Error fetching raw balance for asset {}: {}", asset, err);
                    balances.insert(
                        asset.to_string(),
                        0_u64,
                    );
                }
            }
        }

        let result = Ok(balances);
        ffi_exit!("get_tracked_asset_balances_raw", start_time, thread_id);
        result
    }

    // get a single asset balance
    pub async fn get_asset_balance_by_id(&self, asset: String) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("get_asset_balance_by_id");
        let storage = self.wallet.get_storage().read().await;
        let asset_hash = Hash::from_hex(&asset).context("Invalid assetID")?;

        let Some(asset) = storage.get_asset(&asset_hash).await.ok() else {
            ffi_exit!("get_asset_balance_by_id", start_time, thread_id);
            return Ok("0.0".to_string());
        };

        let balance = storage.get_balance_for(&asset_hash).await?;
        let result = Ok(format_coin(balance.amount, asset.get_decimals()));
        ffi_exit!("get_asset_balance_by_id", start_time, thread_id);
        result
    }

    // get a single asset balance (atomic units)
    pub async fn get_asset_balance_by_id_raw(&self, asset: String) -> Result<u64> {
        let (start_time, thread_id) = ffi_entry!("get_asset_balance_by_id_raw");
        let storage = self.wallet.get_storage().read().await;
        let asset_hash = Hash::from_hex(&asset).context("Invalid assetID")?;
        let Some(_) = storage.get_asset(&asset_hash).await.ok() else {
            ffi_exit!("get_asset_balance_by_id_raw", start_time, thread_id);
            return Ok(0);
        };

        let balance = storage.get_balance_for(&asset_hash).await?;
        let result = Ok(balance.amount);
        ffi_exit!("get_asset_balance_by_id_raw", start_time, thread_id);
        result
    }

    // Helper method to get asset data either from storage or daemon
    async fn get_asset_data(&self, asset_hash: &Hash) -> Result<AssetData> {
        init_asset_cache();
        
        {
            let mut cache_guard = ASSET_DATA_CACHE.lock();
            if let Some(cache) = cache_guard.as_mut() {
                if let Some((data, timestamp)) = cache.get(asset_hash) {
                    // Check if cache entry is still valid
                    if timestamp.elapsed().as_secs() < ASSET_CACHE_TTL_SECS {
                        return Ok(data.clone());
                    } else {
                        cache.pop(asset_hash);
                    }
                }
            }
        }
        
        let storage = self.wallet.get_storage().read().await;
        if let Ok(asset) = storage.get_asset(asset_hash).await {
            debug!("Asset {} found in storage", asset_hash);
            
            let mut cache_guard = ASSET_DATA_CACHE.lock();
            if let Some(cache) = cache_guard.as_mut() {
                cache.put(asset_hash.clone(), (asset.clone(), std::time::Instant::now()));
            }
            
            return Ok(asset);
        }
        
        if !self.wallet.is_online().await {
            return Err(anyhow!("Asset {} not found in wallet storage/cache and wallet is offline", asset_hash));
        }
        
        let asset_data = {
            let network_handler = self.wallet.get_network_handler().lock().await;
            if let Some(handler) = network_handler.as_ref() {
                let api = handler.get_api();
                
                debug!("Fetching asset {} from daemon", asset_hash);
                let data = api.get_asset(asset_hash).await
                    .map_err(|e| anyhow!("Failed to fetch asset from daemon: {}", e))?;
                
                data.inner
            } else {
                return Err(anyhow!("Network handler not available"));
            }
        };
        
        {
            let mut cache_guard = ASSET_DATA_CACHE.lock();
            if let Some(cache) = cache_guard.as_mut() {
                cache.put(asset_hash.clone(), (asset_data.clone(), std::time::Instant::now()));
            }
        }
        
        debug!("GET_ASSET_DATA for {} DONE", asset_hash);
        Ok(asset_data)
    }

    // get the number of decimals of an asset
    pub async fn get_asset_decimals(&self, asset: String) -> Result<u8> {
        let (start_time, thread_id) = ffi_entry!("get_asset_decimals");
        let asset_hash = Hash::from_hex(&asset).context("Invalid assetID")?;
        let asset = self.get_asset_data(&asset_hash).await?;
        let result = Ok(asset.get_decimals());
        ffi_exit!("get_asset_decimals", start_time, thread_id);
        result
    }

    // get the general information about an asset, using its id/hash
    pub async fn get_asset_metadata(&self, asset: String) -> Result<XelisAssetMetadata> {
        let (start_time, thread_id) = ffi_entry!("get_asset_metadata");
        let asset_hash = Hash::from_hex(&asset).context("Invalid assetID")?;
        let asset = self.get_asset_data(&asset_hash).await?;
        
        let owner_wrapper = asset.get_owner().clone().map(|owner| XelisAssetOwner {
            contract: owner.get_contract().to_hex(),
            id: owner.get_id(),
        });

        let result = Ok(XelisAssetMetadata {
            name: asset.get_name().to_string(),
            ticker: asset.get_ticker().to_string(),
            decimals: asset.get_decimals(),
            max_supply: asset.get_max_supply().unwrap_or(u64::MAX),
            owner: owner_wrapper,
        });
        ffi_exit!("get_asset_metadata", start_time, thread_id);
        result
    }

    // get the ticker of an asset
    pub async fn get_asset_ticker(&self, asset: String) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("get_asset_ticker");
        let asset_hash = Hash::from_hex(&asset).context("Invalid assetID")?;
        let asset = self.get_asset_data(&asset_hash).await?;
        let result = Ok(asset.get_ticker().to_string());
        ffi_exit!("get_asset_ticker", start_time, thread_id);
        result
    }

    // rescan the wallet history from a specific height
    pub async fn rescan(&self, topoheight: u64) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("rescan");
        let result = Ok(self.wallet.rescan(topoheight, true).await?);
        ffi_exit!("rescan", start_time, thread_id);
        result
    }

    // estimate the fees for a transaction
    pub async fn estimate_fees(&self, transfers: Vec<Transfer>) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("estimate_fees");
        let transaction_type_builder = self
            .create_transfers(transfers)
            .await
            .context("Error while creating transaction type builder")?;

        let estimated_fees = self
            .wallet
            .estimate_fees(transaction_type_builder, FeeBuilder::default())
            .await
            .context("Error while estimating fees")?;

        let result = Ok(format_coin(estimated_fees, COIN_DECIMALS));
        ffi_exit!("estimate_fees", start_time, thread_id);
        result
    }

    // create a transfer transaction
    pub async fn create_transfers_transaction(&self, transfers: Vec<Transfer>) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("create_transfers_transaction");
        self.pending_transactions.write().clear();

        info!("Building transaction...");

        let transaction_type_builder = self
            .create_transfers(transfers)
            .await
            .context("Error while creating transaction type builder")?;

        let (tx, state) = {
            let mut storage = self.wallet.get_storage().write().await;
            self.wallet
                .create_transaction_with_storage(
                    &mut storage,
                    transaction_type_builder.clone(),
                    FeeBuilder::default(),
                )
                .await?
        };

        info!("Transaction created!");
        let hash = tx.hash();
        info!("Tx Hash: {}", hash);
        let fee = tx.get_fee();

        self.pending_transactions
            .write()
            .insert(hash.clone(), (tx, state));

        let result = Ok(json!(SummaryTransaction {
            hash: hash.to_hex(),
            fee,
            transaction_type: transaction_type_builder
        })
        .to_string());
        ffi_exit!("create_transfers_transaction", start_time, thread_id);
        result
    }

    // create a transfer all transaction
    pub async fn create_transfer_all_transaction(
        &self,
        str_address: String,
        asset_hash: Option<String>,
        extra_data: Option<String>,
    ) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("create_transfer_all_transaction");
        self.pending_transactions.write().clear();

        info!("Building transfer all transaction...");

        let asset = match asset_hash {
            None => XELIS_ASSET,
            Some(value) => Hash::from_hex(&value).context("Invalid assetID")?,
        };

        let mut amount = {
            let storage = self.wallet.get_storage().read().await;
            storage.get_plaintext_balance_for(&asset).await?
        };

        let address = Address::from_string(&str_address).context("Invalid address")?;

        let extra_data = match extra_data {
            None => None,
            Some(value) => Some(DataElement::Value(DataValue::String(value))),
        };

        let transfer = TransferBuilder {
            destination: address.clone(),
            amount,
            asset: asset.clone(),
            extra_data: extra_data.clone(),
            encrypt_extra_data: true,
        };

        let estimated_fees = self
            .wallet
            .estimate_fees(TransactionTypeBuilder::Transfers(vec![transfer]), FeeBuilder::default())
            .await
            .context("Error while estimating fees")?;

        if asset == XELIS_ASSET {
            amount = amount
                .checked_sub(estimated_fees)
                .context("Insufficient balance for fees")?;
        }

        let transfer = TransferBuilder {
            destination: address,
            amount,
            asset: asset.clone(),
            extra_data,
            encrypt_extra_data: true,
        };

        let transaction_type_builder = TransactionTypeBuilder::Transfers(vec![transfer]);

        let (tx, state) = {
            let mut storage = self.wallet.get_storage().write().await;
            self.wallet
                .create_transaction_with_storage(
                    &mut storage,
                    transaction_type_builder.clone(),
                    FeeBuilder::default(),
                )
                .await?
        };

        info!("Transaction created!");
        let hash = tx.hash();
        info!("Tx Hash: {}", hash);
        let fee = tx.get_fee();

        self.pending_transactions
            .write()
            .insert(hash.clone(), (tx, state));

        let result = Ok(json!(SummaryTransaction {
            hash: hash.to_hex(),
            fee,
            transaction_type: transaction_type_builder
        })
        .to_string());
        ffi_exit!("create_transfer_all_transaction", start_time, thread_id);
        result
    }

    // create a burn transaction
    pub async fn create_burn_transaction(
        &self,
        float_amount: f64,
        asset_hash: String,
    ) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("create_burn_transaction");
        self.pending_transactions.write().clear();

        info!("Building burn transaction...");

        let asset = Hash::from_hex(&asset_hash).context("Invalid assetID")?;

        let (amount, decimals) = {
            let storage = self.wallet.get_storage().read().await;
            let decimals = storage
                .get_asset(&asset)
                .await
                .context("Asset not found in storage")?
                .get_decimals();
            let amount: u64 = (float_amount * 10u32.pow(decimals as u32) as f64) as u64;
            (amount, decimals)
        };

        info!("Burning {} of {}", format_coin(amount, decimals), asset);

        let payload = BurnPayload {
            amount,
            asset: asset.clone(),
        };

        let transaction_type_builder = TransactionTypeBuilder::Burn(payload);

        let (tx, state) = {
            let mut storage = self.wallet.get_storage().write().await;
            self.wallet
                .create_transaction_with_storage(
                    &mut storage,
                    transaction_type_builder.clone(),
                    FeeBuilder::Multiplier(1f64),
                )
                .await?
        };

        info!("Transaction created!");
        let hash = tx.hash();
        info!("Tx Hash: {}", hash);
        let fee = tx.get_fee();

        self.pending_transactions
            .write()
            .insert(hash.clone(), (tx, state));

        let result = Ok(json!(SummaryTransaction {
            hash: hash.to_hex(),
            fee,
            transaction_type: transaction_type_builder
        })
        .to_string());
        ffi_exit!("create_burn_transaction", start_time, thread_id);
        result
    }

    // create a burn all transaction for a specific asset
    pub async fn create_burn_all_transaction(&self, asset_hash: String) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("create_burn_all_transaction");
        self.pending_transactions.write().clear();

        info!("Building burn all transaction...");

        let asset = Hash::from_hex(&asset_hash).context("Invalid assetID")?;

        let mut amount = {
            let storage = self.wallet.get_storage().read().await;
            storage.get_plaintext_balance_for(&asset).await?
        };

        info!("Burning all {} of {}", amount, asset);

        let mut payload = BurnPayload {
            amount,
            asset: asset.clone(),
        };

        let estimated_fees = self
            .wallet
            .estimate_fees(TransactionTypeBuilder::Burn(payload.clone()), FeeBuilder::default())
            .await
            .context("Error while estimating fees")?;

        if asset == XELIS_ASSET {
            amount -= estimated_fees;
            payload.amount = amount;
        }

        let transaction_type_builder = TransactionTypeBuilder::Burn(payload);

        let (tx, state) = {
            let mut storage = self.wallet.get_storage().write().await;
            self.wallet
                .create_transaction_with_storage(
                    &mut storage,
                    transaction_type_builder.clone(),
                    FeeBuilder::default(),
                )
                .await?
        };

        info!("Transaction created!");
        let hash = tx.hash();
        info!("Tx Hash: {}", hash);
        let fee = tx.get_fee();

        self.pending_transactions
            .write()
            .insert(hash.clone(), (tx, state));

        let result = Ok(json!(SummaryTransaction {
            hash: hash.to_hex(),
            fee,
            transaction_type: transaction_type_builder
        })
        .to_string());
        ffi_exit!("create_burn_all_transaction", start_time, thread_id);
        result
    }

    // clear a pending transaction
    #[frb(sync)]
    pub fn clear_transaction(
        &self,
        tx_hash: String,
    ) -> Result<(Transaction, TransactionBuilderState)> {
        let (start_time, thread_id) = ffi_entry!("clear_transaction");
        let hash = Hash::from_hex(&tx_hash)?;
        let res = self
            .pending_transactions
            .write()
            .remove(&hash)
            .context("Cannot delete pending transaction");
        info!("tx: {} removed from pending transaction", hash);
        ffi_exit!("clear_transaction", start_time, thread_id);
        res
    }

    // broadcast a transaction to the network
    pub async fn broadcast_transaction(&self, tx_hash: String) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("broadcast_transaction");
        info!("start to broadcast tx: {}", tx_hash);

        if self.wallet.is_online().await {
            let (tx, mut state) = self.clear_transaction(tx_hash.clone())?;
            let mut storage = self.wallet.get_storage().write().await;

            info!("Broadcasting transaction...");
            if let Err(e) = self.wallet.submit_transaction(&tx).await {
                error!("Error while submitting transaction, clearing cache...");
                storage.clear_tx_cache();
                storage.delete_unconfirmed_balances().await;

                warn!("Inserting back to pending transactions in case of retry...");
                let hash: Hash = Hash::from_hex(&tx_hash)?;
                self.pending_transactions.write().insert(hash, (tx, state));

                ffi_exit!("broadcast_transaction", start_time, thread_id);
                bail!(e)
            } else {
                info!("Transaction submitted successfully!");
                state.apply_changes(&mut storage).await?;
                info!("Transaction applied to storage");
            }
        } else {
            ffi_exit!("broadcast_transaction", start_time, thread_id);
            return Err(anyhow!(
                "Wallet is offline, transaction cannot be submitted"
            ));
        }

        ffi_exit!("broadcast_transaction", start_time, thread_id);
        Ok(())
    }

    // get all the transactions history
    pub async fn all_history(&self) -> Result<Vec<String>> {
        let (start_time, thread_id) = ffi_entry!("all_history");
        let mut txs: Vec<String> = Vec::new();

        let storage = self.wallet.get_storage().read().await;
        let mut transactions = storage.get_transactions()?;

        if transactions.is_empty() {
            info!("No transactions available");
            ffi_exit!("all_history", start_time, thread_id);
            return Ok(txs);
        }

        // desc ordered
        transactions.sort_by(|a, b| b.get_topoheight().cmp(&a.get_topoheight()));

        for tx in transactions.into_iter() {
            let transaction_entry = tx.serializable(self.wallet.get_network().is_mainnet());
            let json_tx = serde_json::to_string(&transaction_entry)?;
            txs.push(json_tx);
        }

        let result = Ok(txs);
        ffi_exit!("all_history", start_time, thread_id);
        result
    }

    // Redirect events from wallet to a dart stream
    pub async fn events_stream(&self, sink: StreamSink<String>) {
        let (start_time, thread_id) = ffi_entry!("events_stream");
        let mut rx = self.wallet.subscribe_events().await;

        loop {
            let result = rx.recv().await;
            match result {
                Ok(event) => {
                    let json_event = json!({"event": event.kind(), "data": event}).to_string();
                    if let Err(e) = sink.add(json_event) {
                        debug!("Sink closed or errored: {:?}", e);
                        break;
                    }
                }
                Err(e) => {
                    debug!("Error with events stream: {}", e);
                    break;
                }
            }
        }
        ffi_exit!("events_stream", start_time, thread_id);
    }

    // Get daemon info (network, version, etc)
    pub async fn get_daemon_info(&self) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("get_daemon_info");
        debug!("get_daemon_info");
        let network_handler = self.wallet.get_network_handler().lock().await;
        if let Some(handler) = network_handler.as_ref() {
            let api = handler.get_api();

            let info = match api.get_info().await {
                Ok(info) => info,
                Err(e) => {
                    ffi_exit!("get_daemon_info", start_time, thread_id);
                    return Err(e);
                }
            };

            debug!("get_daemon_info DONE");
            let result = Ok(serde_json::to_string(&info)?);
            ffi_exit!("get_daemon_info", start_time, thread_id);
            result
        } else {
            ffi_exit!("get_daemon_info", start_time, thread_id);
            Err(anyhow!("network handler not available"))
        }
    }

    // Format amount to human readable format
    pub async fn format_coin(
        &self,
        atomic_amount: u64,
        asset_hash: Option<String>,
    ) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("format_coin");
        let asset = match asset_hash {
            None => XELIS_ASSET,
            Some(value) => Hash::from_hex(&value).context("Invalid assetID")?,
        };

        let decimals = {
            let storage = self.wallet.get_storage().read().await;
            let asset = storage
                .get_asset(&asset)
                .await
                .context("Asset not found in storage")?;
            asset.get_decimals()
        };

        let result = Ok(format_coin(atomic_amount, decimals));
        ffi_exit!("format_coin", start_time, thread_id);
        result
    }

    // Export transactions to a CSV file
    pub async fn export_transactions_to_csv_file(&self, file_path: String) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("export_transactions_to_csv_file");
        let path = Path::new(&file_path);
        let storage = self.wallet.get_storage().read().await;
        let transactions = storage.get_transactions()?;
        if transactions.is_empty() {
            ffi_exit!("export_transactions_to_csv_file", start_time, thread_id);
            return Err(anyhow!("No transactions to export"));
        }
        let mut file = File::create(&path).context("Error while creating CSV file")?;
        let result = self.wallet
            .export_transactions_in_csv(&storage, transactions, &mut file)
            .await
            .context("Error while exporting transactions to CSV");
        ffi_exit!("export_transactions_to_csv_file", start_time, thread_id);
        result
    }

    pub async fn convert_transactions_to_csv(&self) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("convert_transactions_to_csv");
        let storage = self.wallet.get_storage().read().await;
        let transactions = storage.get_transactions()?;
        if transactions.is_empty() {
            ffi_exit!("convert_transactions_to_csv", start_time, thread_id);
            return Err(anyhow!("No transactions to export"));
        }
        let mut csv = Vec::new();
        self.wallet
            .export_transactions_in_csv(&storage, transactions, &mut csv)
            .await
            .context("Error while exporting transactions to CSV")?;
        let result = Ok(String::from_utf8(csv).context("Error while converting CSV to string")?);
        ffi_exit!("convert_transactions_to_csv", start_time, thread_id);
        result
    }

    // Private method to create TransactionTypeBuilder from transfers
    async fn create_transfers(&self, transfers: Vec<Transfer>) -> Result<TransactionTypeBuilder> {
        let mut vec = Vec::new();

        for transfer in transfers {
            let asset = Hash::from_hex(&transfer.asset_hash).context("Invalid assetID")?;

            let amount = self
                .convert_float_amount(transfer.float_amount, &asset)
                .await
                .context("Error while converting amount to atomic format")?;

            let address = Address::from_string(&transfer.str_address).context("Invalid address")?;

            let transfer_builder = TransferBuilder {
                destination: address,
                amount,
                asset,
                extra_data: match transfer.extra_data {
                    None => None,
                    Some(value) => Some(DataElement::Value(DataValue::String(value))),
                },
                encrypt_extra_data: true,
            };

            vec.push(transfer_builder);
        }

        Ok(TransactionTypeBuilder::Transfers(vec))
    }

    // Private method to convert float amount to atomic format
    async fn convert_float_amount(&self, float_amount: f64, asset: &Hash) -> Result<u64> {
        let storage = self.wallet.get_storage().read().await;
        let decimals = storage.get_asset(&asset).await?.get_decimals();
        let amount = (float_amount * 10u32.pow(decimals as u32) as f64) as u64;
        Ok(amount)
    }
}

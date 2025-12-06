use flutter_rust_bridge::frb;

use std::collections::HashMap;
use std::num::NonZeroUsize;
use std::fs::File;
use std::path::Path;
use std::sync::Arc;
use std::thread;

use lru::LruCache;

use anyhow::{anyhow, bail, Context, Result};
use indexmap::IndexSet;
use log::{debug, trace, error, info, warn};
use parking_lot::{Mutex, RwLock};
use serde::{Deserialize, Serialize};
use serde_json::json;
use xelis_common::api::wallet::BaseFeeMode;
use xelis_common::api::{DataElement, DataValue};
use xelis_common::asset::{AssetData, AssetOwner};
use xelis_common::config::{COIN_DECIMALS, XELIS_ASSET};
use xelis_common::crypto::{Address, Hash, Hashable, Signature};
use xelis_common::network::Network;
use xelis_common::serializer::Serializer;
use xelis_common::transaction::builder::{
    FeeBuilder, MultiSigBuilder, TransactionTypeBuilder, TransferBuilder, UnsignedTransaction,
};
use xelis_common::transaction::multisig::{MultiSig, SignatureId};
use xelis_common::transaction::BurnPayload;
pub use xelis_common::transaction::Transaction;
use xelis_common::utils::{format_coin, format_xelis};
use xelis_wallet::precomputed_tables;
pub use xelis_wallet::transaction_builder::TransactionBuilderState;
pub use xelis_wallet::precomputed_tables::PrecomputedTablesShared;
use xelis_wallet::wallet::{RecoverOption, Wallet};

use super::precomputed_tables::{LogProgressTableGenerationReportFunction, PrecomputedTableType};
use crate::frb_generated::StreamSink;

// ============================================================================
// FFI Tracing Macros
// ============================================================================

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

// ============================================================================
// Data Transfer Objects (DTOs)
// ============================================================================

#[derive(Serialize, Deserialize, Clone, Debug)]
#[frb(dart_metadata=("freezed"))]
pub struct SummaryTransaction {
    pub hash: String,
    pub fee: u64,
    pub transaction_type: TransactionTypeBuilder,
}

#[derive(Serialize, Deserialize, Clone, Debug)]
pub enum XelisAssetOwner {
    None,
    Creator { contract: String, id: u64 },
    Owner { origin: String, origin_id: u64, owner: String },
}

impl From<&AssetOwner> for XelisAssetOwner {
    fn from(value: &AssetOwner) -> Self {
        match value {
            AssetOwner::None => XelisAssetOwner::None,
            AssetOwner::Creator { contract, id } => XelisAssetOwner::Creator {
                contract: contract.to_hex(),
                id: *id,
            },
            AssetOwner::Owner { origin, origin_id, owner } => XelisAssetOwner::Owner {
                origin: origin.to_hex(),
                origin_id: *origin_id,
                owner: owner.to_hex(),
            },
        }
    }
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
    pub encrypt_extra_data: Option<bool>,
}

#[derive(Clone, Debug, Default)]
pub struct HistoryPageFilter {
    pub page: usize,
    pub limit: Option<usize>,
    pub address: Option<String>,
    pub asset_hash: Option<String>,
    pub min_topoheight: Option<u64>,
    pub max_topoheight: Option<u64>,
    pub accept_incoming: bool,
    pub accept_outgoing: bool,
    pub accept_coinbase: bool,
    pub accept_burn: bool,
}

#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct MultisigDartPayload {
    pub threshold: u8,
    pub participants: Vec<ParticipantDartPayload>,
    pub topoheight: u64,
}

#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct ParticipantDartPayload {
    pub id: u8,
    pub address: String,
}

#[derive(Clone, Debug)]
pub struct SignatureMultisig {
    pub id: u8,
    pub signature: String,
}

// ============================================================================
// XelisWallet Structure
// ============================================================================

pub struct XelisWallet {
    wallet: Arc<Wallet>,
    pending_transactions: RwLock<HashMap<Hash, (Transaction, TransactionBuilderState)>>,
    pending_unsigned: RwLock<
        Option<(
            UnsignedTransaction,
            TransactionBuilderState,
            TransactionTypeBuilder,
        )>,
    >,
}

// ============================================================================
// Static/Global State
// ============================================================================

static CACHED_TABLES: Mutex<Option<PrecomputedTablesShared>> = Mutex::new(None);
static MT_PARAMS: Mutex<Option<(usize, usize)>> = Mutex::new(None);
static ASSET_DATA_CACHE: Mutex<Option<LruCache<Hash, (AssetData, std::time::Instant)>>> =
    Mutex::new(None);

const ASSET_CACHE_TTL_SECS: u64 = 300;

// ============================================================================
// Cache Initialization
// ============================================================================

fn init_asset_cache() {
    let mut cache_guard = ASSET_DATA_CACHE.lock();
    if cache_guard.is_none() {
        let cache = LruCache::new(NonZeroUsize::new(10).unwrap());
        *cache_guard = Some(cache);
    }
}

// ============================================================================
// Global Functions - Cache Management
// ============================================================================

#[frb(sync)]
pub fn clear_asset_cache() {
    if let Some(cache) = ASSET_DATA_CACHE.lock().as_mut() {
        cache.clear();
    }
}

#[frb(sync)]
pub fn get_asset_cache_size() -> usize {
    ASSET_DATA_CACHE
        .lock()
        .as_ref()
        .map(|cache| cache.len())
        .unwrap_or(0)
}

#[frb(sync)]
pub fn get_cached_table() -> Option<PrecomputedTablesShared> {
    let guard = CACHED_TABLES.lock();
    guard.clone()
}

#[frb(sync)]
pub fn clear_cached_tables() {
    CACHED_TABLES.lock().take();
}

#[frb(sync)]
pub fn drop_wallet(wallet: XelisWallet) {
    drop(wallet);
}

// ============================================================================
// Global Functions - Multi-threading Parameters
// ============================================================================

fn get_mt_params() -> (usize, usize) {
    let mut guard = MT_PARAMS.lock();

    if let Some(params) = *guard {
        return params;
    }

    let cpu_cores = thread::available_parallelism()
        .map(|p| p.get())
        .unwrap_or(1);

    let thread_count = (cpu_cores.saturating_sub(2)).max(1).min(32);
    let concurrency = thread_count * 4;

    *guard = Some((thread_count, concurrency));
    (thread_count, concurrency)
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

// ============================================================================
// Global Functions - Precomputed Tables
// ============================================================================

pub async fn update_tables(
    precomputed_tables_path: String,
    precomputed_table_type: PrecomputedTableType,
) -> Result<()> {
    let precomputed_tables_size = if cfg!(target_arch = "wasm32") {
        precomputed_tables::L1_LOW
    } else {
        precomputed_table_type.to_l1_size()?
    };

    let tables = precomputed_tables::read_or_generate_precomputed_tables(
        Some(&precomputed_tables_path),
        precomputed_tables_size,
        LogProgressTableGenerationReportFunction,
        true,
    )
    .await?;

    CACHED_TABLES.lock().replace(tables.clone());
    Ok(())
}

pub fn get_current_precomputed_tables_type() -> Result<PrecomputedTableType> {
    let guard = CACHED_TABLES.lock();
    let tables_arc = guard
        .as_ref()
        .ok_or_else(|| anyhow!("Precomputed tables not initialized"))?;

    let size = {
        let tables_guard = tables_arc
            .read()
            .expect("Failed to read precomputed tables");
        tables_guard.view().get_l1()
    };

    let table_type = match size {
        precomputed_tables::L1_LOW => PrecomputedTableType::L1Low,
        precomputed_tables::L1_MEDIUM => PrecomputedTableType::L1Medium,
        precomputed_tables::L1_FULL => PrecomputedTableType::L1Full,
        c => PrecomputedTableType::Custom(c),
    };

    Ok(table_type)
}

// ============================================================================
// Global Functions - Wallet Creation/Opening
// ============================================================================

pub async fn create_xelis_wallet(
    name: String,
    directory: String,
    password: String,
    network: Network,
    seed: Option<String>,
    private_key: Option<String>,
    precomputed_tables_path: Option<String>,
    precomputed_table_type: PrecomputedTableType,
) -> Result<XelisWallet> {
    // Build full wallet path: <directory>/<name>
    let full_path = if name.is_empty() {
        if directory.is_empty() {
            bail!("Either 'name' or 'directory' must be non-empty");
        }
        directory.clone()
    } else {
        Path::new(&directory)
            .join(&name)
            .to_string_lossy()
            .to_string()
    };

    // Decide L1 size (WASM always uses L1_LOW)
    let precomputed_tables_size = if cfg!(target_arch = "wasm32") {
        precomputed_tables::L1_LOW
    } else {
        precomputed_table_type.to_l1_size()?
    };

    // Use cached tables if available, otherwise generate & cache
    let precomputed_tables = {
        let maybe_cached = CACHED_TABLES.lock().clone();
        match maybe_cached {
            Some(tables) => tables,
            None => {
                let tables = precomputed_tables::read_or_generate_precomputed_tables(
                    precomputed_tables_path.as_deref(),
                    precomputed_tables_size,
                    LogProgressTableGenerationReportFunction,
                    true,
                )
                .await?;

                CACHED_TABLES.lock().replace(tables.clone());
                tables
            }
        }
    };

    // Recover option (seed / private key / none)
    let recover: Option<RecoverOption> = if let Some(seed) = seed.as_deref() {
        Some(RecoverOption::Seed(seed))
    } else if let Some(private_key) = private_key.as_deref() {
        Some(RecoverOption::PrivateKey(private_key))
    } else {
        None
    };

    let (thread_count, concurrency) = get_mt_params();

    let xelis_wallet = Wallet::create(
        &full_path,
        &password,
        recover,
        network,
        precomputed_tables,
        thread_count,
        concurrency,
    )
    .await?;

    Ok(XelisWallet {
        wallet: xelis_wallet,
        pending_transactions: RwLock::new(HashMap::new()),
        pending_unsigned: RwLock::new(None),
    })
}

pub async fn open_xelis_wallet(
    name: String,
    directory: String,
    password: String,
    network: Network,
    precomputed_tables_path: Option<String>,
    precomputed_table_type: PrecomputedTableType,
) -> Result<XelisWallet> {
    // Build full wallet path: <directory>/<name>
    let full_path = if name.is_empty() {
        if directory.is_empty() {
            bail!("Either 'name' or 'directory' must be non-empty");
        }
        directory.clone()
    } else {
        Path::new(&directory)
            .join(&name)
            .to_string_lossy()
            .to_string()
    };

    let precomputed_tables_size = if cfg!(target_arch = "wasm32") {
        precomputed_tables::L1_LOW
    } else {
        precomputed_table_type.to_l1_size()?
    };

    let precomputed_tables = {
        let maybe_cached = CACHED_TABLES.lock().clone();
        match maybe_cached {
            Some(tables) => tables,
            None => {
                let tables = precomputed_tables::read_or_generate_precomputed_tables(
                    precomputed_tables_path.as_deref(),
                    precomputed_tables_size,
                    LogProgressTableGenerationReportFunction,
                    true,
                )
                .await?;

                CACHED_TABLES.lock().replace(tables.clone());
                tables
            }
        }
    };

    let (thread_count, concurrency) = get_mt_params();

    let xelis_wallet = Wallet::open(
        &full_path,
        &password,
        network,
        precomputed_tables,
        thread_count,
        concurrency,
    )?;

    Ok(XelisWallet {
        wallet: xelis_wallet,
        pending_transactions: RwLock::new(HashMap::new()),
        pending_unsigned: RwLock::new(None),
    })
}

// ============================================================================
// XelisWallet Implementation
// ============================================================================

impl XelisWallet {
    #[frb(ignore)]
    pub fn get_wallet(&self) -> &Arc<Wallet> {
        &self.wallet
    }

    // ========================================================================
    // Wallet Management
    // ========================================================================

    pub async fn change_password(&self, old_password: String, new_password: String) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("change_password");
        let result = self.wallet.set_password(&old_password, &new_password).await;
        ffi_exit!("change_password", start_time, thread_id);
        result
    }

    pub async fn online_mode(&self, daemon_address: String) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("online_mode");
        let result = self.wallet.set_online_mode(&daemon_address, true).await;
        ffi_exit!("online_mode", start_time, thread_id);
        Ok(result?)
    }

    pub async fn offline_mode(&self) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("offline_mode");
        let result = self.wallet.set_offline_mode().await;
        ffi_exit!("offline_mode", start_time, thread_id);
        Ok(result?)
    }

    pub async fn is_online(&self) -> bool {
        let (start_time, thread_id) = ffi_entry!("is_online");
        let result = self.wallet.is_online().await;
        ffi_exit!("is_online", start_time, thread_id);
        result
    }

    #[frb(sync)]
    pub fn get_address_str(&self) -> String {
        let (start_time, thread_id) = ffi_entry!("get_address_str");
        let result = self.wallet.get_address().to_string();
        ffi_exit!("get_address_str", start_time, thread_id);
        result
    }

    #[frb(sync)]
    pub fn get_network(&self) -> Network {
        let (start_time, thread_id) = ffi_entry!("get_network");
        let result = self.wallet.get_network().clone();
        ffi_exit!("get_network", start_time, thread_id);
        result
    }

    pub async fn close(&self) {
        let (start_time, thread_id) = ffi_entry!("close");
        clear_asset_cache();
        self.wallet.close().await;
        ffi_exit!("close", start_time, thread_id);
    }

    pub async fn get_seed(&self, language_index: Option<usize>) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("get_seed");
        let index = language_index.unwrap_or_default();
        let result = self.wallet.get_seed(index);
        ffi_exit!("get_seed", start_time, thread_id);
        result
    }

    pub async fn get_nonce(&self) -> u64 {
        let (start_time, thread_id) = ffi_entry!("get_nonce");
        let result = self.wallet.get_nonce().await;
        ffi_exit!("get_nonce", start_time, thread_id);
        result
    }

    pub async fn is_valid_password(&self, password: String) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("is_valid_password");
        let result = self.wallet.is_valid_password(&password).await;
        ffi_exit!("is_valid_password", start_time, thread_id);
        result
    }

    // ========================================================================
    // Balance & Assets
    // ========================================================================

    pub async fn has_xelis_balance(&self) -> Result<bool> {
        let (start_time, thread_id) = ffi_entry!("has_xelis_balance");
        let storage = self.wallet.get_storage().read().await;
        let result = storage.has_balance_for(&XELIS_ASSET).await;
        ffi_exit!("has_xelis_balance", start_time, thread_id);
        result
    }

    pub async fn has_asset_balance(&self, asset: String) -> Result<bool> {
        let (start_time, thread_id) = ffi_entry!("has_asset_balance");
        let asset_hash = Hash::from_hex(&asset).context("Invalid asset")?;
        let storage = self.wallet.get_storage().read().await;
        let result = storage.has_balance_for(&asset_hash).await;
        ffi_exit!("has_asset_balance", start_time, thread_id);
        result
    }

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

    pub async fn get_tracked_balances(&self) -> Result<HashMap<String, String>> {
        let (start_time, thread_id) = ffi_entry!("get_tracked_balances");
        let storage = self.wallet.get_storage().read().await;
        let tracked_assets = storage.get_tracked_assets()?;

        let mut balances = HashMap::new();

        for asset in tracked_assets {
            let asset = asset?;
            if storage.has_balance_for(&asset).await.unwrap_or(false) {
                info!("Asset {} is tracked and has a balance", asset);
                let balance = storage
                    .get_plaintext_balance_for(&asset)
                    .await
                    .context("Error retrieving balance")?;
                let asset_data = storage
                    .get_asset(&asset)
                    .await
                    .context("Error retrieving asset data")?;
                balances.insert(
                    asset.to_hex(),
                    format_coin(balance, asset_data.get_decimals()),
                );
            } else {
                warn!("Asset {} is tracked but not found in storage", asset);
            }
        }

        ffi_exit!("get_tracked_balances", start_time, thread_id);
        Ok(balances)
    }

    pub async fn get_tracked_asset_balances_raw(&self) -> Result<HashMap<String, u64>> {
        let (start_time, thread_id) = ffi_entry!("get_tracked_asset_balances_raw");
        let storage = self.wallet.get_storage().read().await;
        let mut balances = HashMap::new();

        let tracked_assets = storage.get_tracked_assets()?;

        for asset_result in tracked_assets {
            let asset = asset_result?;
            match storage.get_balance_for(&asset).await {
                Ok(balance) => {
                    balances.insert(asset.to_string(), balance.amount);
                }
                Err(err) => {
                    debug!("Error fetching raw balance for asset {}: {}", asset, err);
                    balances.insert(asset.to_string(), 0_u64);
                }
            }
        }

        let result = Ok(balances);
        ffi_exit!("get_tracked_asset_balances_raw", start_time, thread_id);
        result
    }

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
                            debug!(
                                "Error with asset balance data entry for asset {}: {}",
                                asset, err
                            );
                            balances.insert(asset.to_string(), format_xelis(0));
                        }
                    }
                }
                Err(err) => {
                    debug!("Error in get_asset_balances: {}", err);
                }
            }
        }
        let result = Ok(balances);
        ffi_exit!("get_asset_balances", start_time, thread_id);
        result
    }

    pub async fn get_asset_balance_by_id(&self, asset: String) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("get_asset_balance_by_id");
        let storage = self.wallet.get_storage().read().await;
        let asset_hash = Hash::from_hex(&asset).context("Invalid asset")?;

        let Some(asset_data) = storage.get_asset(&asset_hash).await.ok() else {
            ffi_exit!("get_asset_balance_by_id", start_time, thread_id);
            return Ok("0.0".to_string());
        };

        let balance = storage.get_balance_for(&asset_hash).await?;
        let result = Ok(format_coin(balance.amount, asset_data.get_decimals()));
        ffi_exit!("get_asset_balance_by_id", start_time, thread_id);
        result
    }

    pub async fn get_asset_balance_by_id_raw(&self, asset: String) -> Result<u64> {
        let (start_time, thread_id) = ffi_entry!("get_asset_balance_by_id_raw");
        let storage = self.wallet.get_storage().read().await;
        let asset_hash = Hash::from_hex(&asset).context("Invalid asset")?;
        let Some(_) = storage.get_asset(&asset_hash).await.ok() else {
            ffi_exit!("get_asset_balance_by_id_raw", start_time, thread_id);
            return Ok(0);
        };

        let balance = storage.get_balance_for(&asset_hash).await?;
        let result = Ok(balance.amount);
        ffi_exit!("get_asset_balance_by_id_raw", start_time, thread_id);
        result
    }

    pub async fn get_all_assets(&self) -> Result<Vec<(String, XelisAssetMetadata)>> {
        let (start_time, thread_id) = ffi_entry!("get_all_assets");
        let storage = self.wallet.get_storage().read().await;
        let mut assets = Vec::new();

        for res in storage.get_assets_with_data().await? {
            match res {
                Ok((asset, data)) => {
                    let owner_dto = XelisAssetOwner::from(data.get_owner());

                    assets.push((
                        asset.to_string(),
                        XelisAssetMetadata {
                            name: data.get_name().to_string(),
                            ticker: data.get_ticker().to_string(),
                            decimals: data.get_decimals(),
                            max_supply: data.get_max_supply().get_max().unwrap_or(u64::MAX),
                            owner: Some(owner_dto),
                        },
                    ));
                }
                Err(err) => {
                    debug!("Error in get_all_assets: {}", err);
                }
            }
        }

        let result = Ok(assets);
        ffi_exit!("get_all_assets", start_time, thread_id);
        result
    }

    pub async fn get_known_assets(&self) -> Result<HashMap<String, String>> {
        let (start_time, thread_id) = ffi_entry!("get_known_assets");
        let storage = self.wallet.get_storage().read().await;

        let mut assets = HashMap::new();

        for res in storage.get_assets_with_data().await? {
            match res {
                Ok((hash, asset_data)) => {
                    let owner_dto = XelisAssetOwner::from(asset_data.get_owner());

                    let dto = XelisAssetMetadata {
                        name: asset_data.get_name().to_string(),
                        ticker: asset_data.get_ticker().to_string(),
                        decimals: asset_data.get_decimals(),
                        max_supply: asset_data.get_max_supply().get_max().unwrap_or(u64::MAX),
                        owner: Some(owner_dto),
                    };

                    let json_str = serde_json::to_string(&dto)?;
                    assets.insert(hash.to_hex(), json_str);
                }
                Err(e) => {
                    error!("Error retrieving asset data: {}", e);
                }
            }
        }

        ffi_exit!("get_known_assets", start_time, thread_id);
        Ok(assets)
    }

    pub async fn is_asset_tracked(&self, asset: String) -> Result<bool> {
        let (start_time, thread_id) = ffi_entry!("is_asset_tracked");
        let asset_hash = Hash::from_hex(&asset).context("Invalid asset")?;

        let storage = self.wallet.get_storage().read().await;
        let result = storage.is_asset_tracked(&asset_hash);
        ffi_exit!("is_asset_tracked", start_time, thread_id);
        result
    }

    pub async fn track_asset(&self, asset: String) -> Result<bool> {
        let (start_time, thread_id) = ffi_entry!("track_asset");
        debug!("TRACK IS CALLED");
        let asset_hash = Hash::from_hex(&asset).context("Invalid asset")?;

        debug!("WAITING FOR INTERNAL");
        let result = self
            .wallet
            .track_asset(asset_hash)
            .await
            .map_err(|e| anyhow::anyhow!("Failed to track asset: {}", e));
        ffi_exit!("track_asset", start_time, thread_id);
        result
    }

    pub async fn untrack_asset(&self, asset: String) -> Result<bool> {
        let (start_time, thread_id) = ffi_entry!("untrack_asset");
        let asset_hash = Hash::from_hex(&asset).context("Invalid asset")?;

        let result = self
            .wallet
            .untrack_asset(asset_hash)
            .await
            .map_err(|e| anyhow::anyhow!("Failed to untrack asset: {}", e));
        ffi_exit!("untrack_asset", start_time, thread_id);
        result
    }

    async fn get_asset_data(&self, asset_hash: &Hash) -> Result<AssetData> {
        init_asset_cache();

        // 1. cache
        {
            let mut cache_guard = ASSET_DATA_CACHE.lock();
            if let Some(cache) = cache_guard.as_mut() {
                if let Some((data, timestamp)) = cache.get(asset_hash) {
                    if timestamp.elapsed().as_secs() < ASSET_CACHE_TTL_SECS {
                        return Ok(data.clone());
                    } else {
                        cache.pop(asset_hash);
                    }
                }
            }
        }

        // 2. storage
        let storage = self.wallet.get_storage().read().await;
        if let Ok(asset) = storage.get_asset(asset_hash).await {
            debug!("Asset {} found in storage", asset_hash);
            let mut cache_guard = ASSET_DATA_CACHE.lock();
            if let Some(cache) = cache_guard.as_mut() {
                cache.put(
                    asset_hash.clone(),
                    (asset.clone(), std::time::Instant::now()),
                );
            }
            return Ok(asset);
        }

        // 3. offline guard
        if !self.wallet.is_online().await {
            return Err(anyhow!(
                "Asset {} not found in wallet storage/cache and wallet is offline",
                asset_hash
            ));
        }

        // 4. daemon
        let asset_data = {
            let network_handler = self.wallet.get_network_handler().lock().await;
            if let Some(handler) = network_handler.as_ref() {
                let api = handler.get_api();
                debug!("Fetching asset {} from daemon", asset_hash);
                let data = api
                    .get_asset(asset_hash)
                    .await
                    .map_err(|e| anyhow!("Failed to fetch asset from daemon: {}", e))?;

                data.inner
            } else {
                return Err(anyhow!("Network handler not available"));
            }
        };

        // 5. cache it
        {
            let mut cache_guard = ASSET_DATA_CACHE.lock();
            if let Some(cache) = cache_guard.as_mut() {
                cache.put(
                    asset_hash.clone(),
                    (asset_data.clone(), std::time::Instant::now()),
                );
            }
        }

        debug!("GET_ASSET_DATA for {} DONE", asset_hash);
        Ok(asset_data)
    }

    pub async fn get_asset_decimals(&self, asset: String) -> Result<u8> {
        let (start_time, thread_id) = ffi_entry!("get_asset_decimals");
        let asset_hash = Hash::from_hex(&asset).context("Invalid asset")?;
        let data = self.get_asset_data(&asset_hash).await?;
        let result = Ok(data.get_decimals());
        ffi_exit!("get_asset_decimals", start_time, thread_id);
        result
    }

    pub async fn get_asset_ticker(&self, asset: String) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("get_asset_ticker");
        let asset_hash = Hash::from_hex(&asset).context("Invalid asset")?;
        let data = self.get_asset_data(&asset_hash).await?;
        let result = Ok(data.get_ticker().to_string());
        ffi_exit!("get_asset_ticker", start_time, thread_id);
        result
    }

    pub async fn get_asset_metadata(&self, asset: String) -> Result<XelisAssetMetadata> {
        let (start_time, thread_id) = ffi_entry!("get_asset_metadata");
        let asset_hash = Hash::from_hex(&asset).context("Invalid asset")?;
        let asset_data = self.get_asset_data(&asset_hash).await?;

        let owner_dto = XelisAssetOwner::from(asset_data.get_owner());

        let result = Ok(XelisAssetMetadata {
            name: asset_data.get_name().to_string(),
            ticker: asset_data.get_ticker().to_string(),
            decimals: asset_data.get_decimals(),
            max_supply: asset_data.get_max_supply().get_max().unwrap_or(u64::MAX),
            owner: Some(owner_dto),
        });
        ffi_exit!("get_asset_metadata", start_time, thread_id);
        result
    }

    // ========================================================================
    // Regular Transactions
    // ========================================================================

    pub async fn rescan(&self, topoheight: u64) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("rescan");
        let result = Ok(self.wallet.rescan(topoheight, true).await?);
        ffi_exit!("rescan", start_time, thread_id);
        result
    }

    pub async fn estimate_fees(&self, transfers: Vec<Transfer>) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("estimate_fees");
        let transaction_type_builder = self
            .create_transfers(transfers)
            .await
            .context("Error while creating transaction type builder")?;

        let estimated_fees = self
            .wallet
            .estimate_fees(
                transaction_type_builder,
                FeeBuilder::default(),
                BaseFeeMode::None,
            )
            .await
            .context("Error while estimating fees")?;

        let result = Ok(format_coin(estimated_fees, COIN_DECIMALS));
        ffi_exit!("estimate_fees", start_time, thread_id);
        result
    }

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
                    BaseFeeMode::None,
                    None,
                )
                .await?
        };

        info!("Transaction created!");
        let hash = tx.hash();
        info!("Tx Hash: {}", hash);
        let fee = tx.get_fee();

        self.pending_transactions
            .write()
            .insert(hash.clone(), (tx.clone(), state));

        let result = Ok(json!(SummaryTransaction {
            hash: hash.to_hex(),
            fee,
            transaction_type: transaction_type_builder
        })
        .to_string());
        ffi_exit!("create_transfers_transaction", start_time, thread_id);
        result
    }

    pub async fn create_transfer_all_transaction(
        &self,
        str_address: String,
        asset_hash: Option<String>,
        extra_data: Option<String>,
        encrypt_extra_data: Option<bool>,
    ) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("create_transfer_all_transaction");
        self.pending_transactions.write().clear();

        info!("Building transfer all transaction...");

        let asset = match asset_hash {
            None => XELIS_ASSET,
            Some(value) => Hash::from_hex(&value).context("Invalid asset")?,
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

        let encrypt = encrypt_extra_data.unwrap_or(false);

        let transfer = TransferBuilder {
            destination: address.clone(),
            amount,
            asset: asset.clone(),
            extra_data: extra_data.clone(),
            encrypt_extra_data: encrypt,
        };

        let estimated_fees = self
            .wallet
            .estimate_fees(
                TransactionTypeBuilder::Transfers(vec![transfer]),
                FeeBuilder::default(),
                BaseFeeMode::None,
            )
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
            encrypt_extra_data: encrypt,
        };

        let transaction_type_builder = TransactionTypeBuilder::Transfers(vec![transfer]);

        let (tx, state) = {
            let mut storage = self.wallet.get_storage().write().await;
            self.wallet
                .create_transaction_with_storage(
                    &mut storage,
                    transaction_type_builder.clone(),
                    FeeBuilder::default(),
                    BaseFeeMode::None,
                    None,
                )
                .await?
        };

        info!("Transaction created!");
        let hash = tx.hash();
        info!("Tx Hash: {}", hash);
        let fee = tx.get_fee();

        self.pending_transactions
            .write()
            .insert(hash.clone(), (tx.clone(), state));

        let result = Ok(json!(SummaryTransaction {
            hash: hash.to_hex(),
            fee,
            transaction_type: transaction_type_builder
        })
        .to_string());
        ffi_exit!("create_transfer_all_transaction", start_time, thread_id);
        result
    }

    pub async fn create_burn_transaction(
        &self,
        float_amount: f64,
        asset_hash: String,
    ) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("create_burn_transaction");
        self.pending_transactions.write().clear();

        info!("Building burn transaction...");

        let asset = Hash::from_hex(&asset_hash).context("Invalid asset")?;

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
                    FeeBuilder::default(),
                    BaseFeeMode::None,
                    None,
                )
                .await?
        };

        info!("Transaction created!");
        let hash = tx.hash();
        info!("Tx Hash: {}", hash);
        let fee = tx.get_fee();

        self.pending_transactions
            .write()
            .insert(hash.clone(), (tx.clone(), state));

        let result = Ok(json!(SummaryTransaction {
            hash: hash.to_hex(),
            fee,
            transaction_type: transaction_type_builder
        })
        .to_string());
        ffi_exit!("create_burn_transaction", start_time, thread_id);
        result
    }

    pub async fn create_burn_all_transaction(&self, asset_hash: String) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("create_burn_all_transaction");
        self.pending_transactions.write().clear();

        info!("Building burn all transaction...");

        let asset = Hash::from_hex(&asset_hash).context("Invalid asset")?;

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
            .estimate_fees(
                TransactionTypeBuilder::Burn(payload.clone()),
                FeeBuilder::default(),
                BaseFeeMode::None,
            )
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
                    BaseFeeMode::None,
                    None,
                )
                .await?
        };

        info!("Transaction created!");
        let hash = tx.hash();
        info!("Tx Hash: {}", hash);
        let fee = tx.get_fee();

        self.pending_transactions
            .write()
            .insert(hash.clone(), (tx.clone(), state));

        let result = Ok(json!(SummaryTransaction {
            hash: hash.to_hex(),
            fee,
            transaction_type: transaction_type_builder
        })
        .to_string());
        ffi_exit!("create_burn_all_transaction", start_time, thread_id);
        result
    }

    // ========================================================================
    // Multisig Transactions
    // ========================================================================

    pub async fn create_multisig_transfers_transaction(
        &self,
        transfers: Vec<Transfer>,
    ) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("create_multisig_transfers_transaction");
        info!("Building multisig transaction...");

        let multisig = {
            let storage = self.wallet.get_storage().read().await;
            let multisig = storage
                .get_multisig_state()
                .await
                .context("Error while reading multisig state")?;
            multisig.cloned()
        };

        match multisig {
            Some(multisig) => {
                let transaction_type_builder = self
                    .create_transfers(transfers)
                    .await
                    .context("Error while creating transaction type builder")?;

                let (unsigned, state) = self
                    .build_unsigned_transaction(
                        transaction_type_builder.clone(),
                        FeeBuilder::default(),
                        multisig.payload.threshold,
                    )
                    .await?;

                let hash = unsigned.get_hash_for_multisig().to_hex();

                let mut pending_unsigned = self.pending_unsigned.write();

                *pending_unsigned = Some((unsigned, state, transaction_type_builder));

                info!("Unsigned transaction created: {}", hash);

                ffi_exit!("create_multisig_transfers_transaction", start_time, thread_id);
                Ok(hash)
            }
            None => {
                ffi_exit!("create_multisig_transfers_transaction", start_time, thread_id);
                bail!("No multisig configured");
            }
        }
    }

    pub async fn create_multisig_transfer_all_transaction(
        &self,
        str_address: String,
        asset_hash: Option<String>,
        extra_data: Option<String>,
        encrypt_extra_data: Option<bool>,
    ) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("create_multisig_transfer_all_transaction");
        info!("Building multisig transfer all transaction...");

        let asset = match asset_hash {
            None => XELIS_ASSET,
            Some(value) => Hash::from_hex(&value).context("Invalid asset")?,
        };

        let (mut amount, multisig) = {
            let storage = self.wallet.get_storage().read().await;
            let amount = storage.get_plaintext_balance_for(&asset).await?;
            let multisig = storage
                .get_multisig_state()
                .await
                .context("Error while reading multisig state")?;
            (amount, multisig.cloned())
        };

        match multisig {
            Some(multisig) => {
                let address = Address::from_string(&str_address).context("Invalid address")?;

                let extra_data = match extra_data {
                    None => None,
                    Some(value) => Some(DataElement::Value(DataValue::String(value))),
                };

                let encrypt = encrypt_extra_data.unwrap_or(false);

                let transfer = TransferBuilder {
                    destination: address.clone(),
                    amount,
                    asset: asset.clone(),
                    extra_data: extra_data.clone(),
                    encrypt_extra_data: encrypt,
                };

                let estimated_fees = self
                    .wallet
                    .estimate_fees(
                        TransactionTypeBuilder::Transfers(vec![transfer]),
                        FeeBuilder::default(),
                        BaseFeeMode::None,
                    )
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
                    encrypt_extra_data: encrypt,
                };

                let transaction_type_builder = TransactionTypeBuilder::Transfers(vec![transfer]);

                let (unsigned, state) = self
                    .build_unsigned_transaction(
                        transaction_type_builder.clone(),
                        FeeBuilder::default(),
                        multisig.payload.threshold,
                    )
                    .await?;

                let hash = unsigned.get_hash_for_multisig().to_hex();

                let mut pending_unsigned = self.pending_unsigned.write();

                *pending_unsigned = Some((unsigned, state, transaction_type_builder));

                info!("Unsigned transaction created: {}", hash);

                ffi_exit!("create_multisig_transfer_all_transaction", start_time, thread_id);
                Ok(hash)
            }
            None => {
                ffi_exit!("create_multisig_transfer_all_transaction", start_time, thread_id);
                bail!("No multisig configured");
            }
        }
    }

    pub async fn create_multisig_burn_transaction(
        &self,
        float_amount: f64,
        asset_hash: String,
    ) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("create_multisig_burn_transaction");
        info!("Building multisig burn transaction...");

        let asset = Hash::from_hex(&asset_hash).context("Invalid asset")?;

        let (amount, decimals, multisig) = {
            let storage = self.wallet.get_storage().read().await;
            let decimals = storage
                .get_asset(&asset)
                .await
                .context("Asset not found in storage")?
                .get_decimals();
            let amount: u64 = (float_amount * 10u32.pow(decimals as u32) as f64) as u64;
            let multisig = storage
                .get_multisig_state()
                .await
                .context("Error while reading multisig state")?;
            (amount, decimals, multisig.cloned())
        };

        match multisig {
            Some(multisig) => {
                info!("Burning {} of {}", format_coin(amount, decimals), asset);

                let payload = BurnPayload {
                    amount,
                    asset: asset.clone(),
                };

                let transaction_type_builder = TransactionTypeBuilder::Burn(payload);

                let (unsigned, state) = self
                    .build_unsigned_transaction(
                        transaction_type_builder.clone(),
                        FeeBuilder::default(),
                        multisig.payload.threshold,
                    )
                    .await?;

                let hash = unsigned.get_hash_for_multisig().to_hex();

                let mut pending_unsigned = self.pending_unsigned.write();

                *pending_unsigned = Some((unsigned, state, transaction_type_builder));

                info!("Unsigned transaction created: {}", hash);

                ffi_exit!("create_multisig_burn_transaction", start_time, thread_id);
                Ok(hash)
            }
            None => {
                ffi_exit!("create_multisig_burn_transaction", start_time, thread_id);
                bail!("No multisig configured");
            }
        }
    }

    pub async fn create_multisig_burn_all_transaction(&self, asset_hash: String) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("create_multisig_burn_all_transaction");
        info!("Building multisig burn all transaction...");

        let asset = Hash::from_hex(&asset_hash).context("Invalid asset")?;

        let (mut amount, multisig) = {
            let storage = self.wallet.get_storage().read().await;
            let amount = storage.get_plaintext_balance_for(&asset).await?;
            let multisig = storage
                .get_multisig_state()
                .await
                .context("Error while reading multisig state")?;
            (amount, multisig.cloned())
        };

        match multisig {
            Some(multisig) => {
                info!("Burning all {} of {}", amount, asset);

                let mut payload = BurnPayload {
                    amount,
                    asset: asset.clone(),
                };

                let estimated_fees = self
                    .wallet
                    .estimate_fees(
                        TransactionTypeBuilder::Burn(payload.clone()),
                        FeeBuilder::default(),
                        BaseFeeMode::None,
                    )
                    .await
                    .context("Error while estimating fees")?;

                if asset == XELIS_ASSET {
                    amount -= estimated_fees;
                    payload.amount = amount;
                }

                let transaction_type_builder = TransactionTypeBuilder::Burn(payload);

                let (unsigned, state) = self
                    .build_unsigned_transaction(
                        transaction_type_builder.clone(),
                        FeeBuilder::default(),
                        multisig.payload.threshold,
                    )
                    .await?;

                let hash = unsigned.get_hash_for_multisig().to_hex();

                let mut pending_unsigned = self.pending_unsigned.write();

                *pending_unsigned = Some((unsigned, state, transaction_type_builder));

                info!("Unsigned transaction created: {}", hash);

                ffi_exit!("create_multisig_burn_all_transaction", start_time, thread_id);
                Ok(hash)
            }
            None => {
                ffi_exit!("create_multisig_burn_all_transaction", start_time, thread_id);
                bail!("No multisig configured");
            }
        }
    }

    // ========================================================================
    // Transaction Lifecycle
    // ========================================================================

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
                state
                    .apply_changes(&mut storage)
                    .await
                    .context("Error while applying changes")?;
                info!("Transaction applied to storage");
            }
        } else {
            ffi_exit!("broadcast_transaction", start_time, thread_id);
            bail!("Wallet is offline, transaction cannot be submitted");
        }

        ffi_exit!("broadcast_transaction", start_time, thread_id);
        Ok(())
    }

    // ========================================================================
    // History & Events
    // ========================================================================

    pub async fn get_history_count(&self) -> Result<usize> {
        let (start_time, thread_id) = ffi_entry!("get_history_count");
        let storage = self.wallet.get_storage().read().await;
        let result = Ok(storage.get_transactions_count()?);
        ffi_exit!("get_history_count", start_time, thread_id);
        result
    }

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

    pub async fn history(&self, filter: HistoryPageFilter) -> Result<Vec<String>> {
        let (start_time, thread_id) = ffi_entry!("history");
        let mut txs: Vec<String> = Vec::new();

        let storage = self.wallet.get_storage().read().await;

        let txs_len = storage.get_transactions_count()?;
        info!("Transactions available: {}", txs_len);
        if txs_len == 0 {
            info!("No transactions available");
            ffi_exit!("history", start_time, thread_id);
            return Ok(txs);
        }

        if let Some(limit) = filter.limit {
            if limit == 0 {
                ffi_exit!("history", start_time, thread_id);
                bail!("Limit cannot be 0");
            }

            let mut max_pages = txs_len / limit;
            if txs_len % limit != 0 {
                max_pages += 1;
            }

            if filter.page > max_pages {
                info!("Page out of range");
                ffi_exit!("history", start_time, thread_id);
                return Ok(txs);
            }
        }

        let address = match filter.address {
            Some(address) => {
                let address = Address::from_string(&address).context("Invalid address")?;
                Some(address.get_public_key().to_owned())
            }
            None => None,
        };

        let asset = match filter.asset_hash {
            Some(asset_hash) => Some(Hash::from_hex(&asset_hash).context("Invalid asset")?),
            None => None,
        };

        let transactions = storage.get_filtered_transactions(
            address.as_ref(),
            asset.as_ref(),
            filter.min_topoheight,
            filter.max_topoheight,
            filter.accept_incoming,
            filter.accept_outgoing,
            match address {
                Some(_) => false,
                None => filter.accept_coinbase,
            },
            match address {
                Some(_) => false,
                None => filter.accept_burn,
            },
            None,
            filter.limit,
            match filter.limit {
                Some(limit) => Some((filter.page - 1) * limit),
                None => None,
            },
        )?;

        for tx in transactions {
            let transaction_entry = tx.serializable(self.wallet.get_network().is_mainnet());
            let json_tx = serde_json::to_string(&transaction_entry)?;
            txs.push(json_tx);
        }

        ffi_exit!("history", start_time, thread_id);
        Ok(txs)
    }

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
                    error!("Error with events stream: {}", e);
                    break;
                }
            }
        }
        ffi_exit!("events_stream", start_time, thread_id);
    }

    // ========================================================================
    // Utilities
    // ========================================================================

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
                    bail!("Error while getting daemon info: {}", e);
                }
            };

            debug!("get_daemon_info DONE");
            let result = Ok(serde_json::to_string(&info)?);
            ffi_exit!("get_daemon_info", start_time, thread_id);
            result
        } else {
            ffi_exit!("get_daemon_info", start_time, thread_id);
            bail!("network handler not available")
        }
    }

    pub async fn format_coin(
        &self,
        atomic_amount: u64,
        asset_hash: Option<String>,
    ) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("format_coin");
        let asset = match asset_hash {
            None => XELIS_ASSET,
            Some(value) => Hash::from_hex(&value).context("Invalid asset")?,
        };

        let data = self.get_asset_data(&asset).await?;
        let result = Ok(format_coin(atomic_amount, data.get_decimals()));
        ffi_exit!("format_coin", start_time, thread_id);
        result
    }

    // ========================================================================
    // Export
    // ========================================================================

    pub async fn export_transactions_to_csv_file(&self, file_path: String) -> Result<()> {
        let (start_time, thread_id) = ffi_entry!("export_transactions_to_csv_file");
        let path = Path::new(&file_path);
        let storage = self.wallet.get_storage().read().await;
        let transactions = storage.get_transactions()?;
        if transactions.is_empty() {
            ffi_exit!("export_transactions_to_csv_file", start_time, thread_id);
            bail!("No transactions to export");
        }
        let mut file = File::create(&path).context("Error while creating CSV file")?;
        self.wallet
            .export_transactions_in_csv(&storage, transactions, &mut file)
            .await
            .context("Error while exporting transactions to CSV")?;
        ffi_exit!("export_transactions_to_csv_file", start_time, thread_id);
        Ok(())
    }

    pub async fn convert_transactions_to_csv(&self) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("convert_transactions_to_csv");
        let storage = self.wallet.get_storage().read().await;
        let transactions = storage.get_transactions()?;
        if transactions.is_empty() {
            ffi_exit!("convert_transactions_to_csv", start_time, thread_id);
            bail!("No transactions to export");
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

    // ========================================================================
    // Multisig Management
    // ========================================================================

    pub async fn get_multisig_state(&self) -> Result<Option<String>> {
        let (start_time, thread_id) = ffi_entry!("get_multisig_state");
        let storage = self.wallet.get_storage().read().await;
        let multisig = storage
            .get_multisig_state()
            .await
            .context("Error while reading multisig state")?;
        let result = match multisig {
            Some(multisig) => Ok(Some(
                json!(MultisigDartPayload {
                    threshold: multisig.payload.threshold,
                    participants: multisig
                        .payload
                        .participants
                        .iter()
                        .enumerate()
                        .map(|(i, p)| {
                            ParticipantDartPayload {
                                id: i as u8,
                                address: p
                                    .as_address(self.wallet.get_network().is_mainnet())
                                    .to_string(),
                            }
                        })
                        .collect::<Vec<_>>(),
                    topoheight: multisig.topoheight
                })
                .to_string(),
            )),
            None => Ok(None),
        };
        ffi_exit!("get_multisig_state", start_time, thread_id);
        result
    }

    pub async fn multisig_setup(&self, threshold: u8, participants: Vec<String>) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("multisig_setup");
        info!("Setting up multisig...");
        let multisig = {
            let storage = self.wallet.get_storage().read().await;
            let multisig = storage
                .get_multisig_state()
                .await
                .context("Error while reading multisig state")?;
            multisig.cloned()
        };

        match multisig {
            Some(_multisig) => {
                ffi_exit!("multisig_setup", start_time, thread_id);
                bail!("Multisig already configured");
            }
            None => {
                let mut participant_addresses = IndexSet::with_capacity(participants.len());
                for participant in participants {
                    let address = Address::from_string(&participant).context("Invalid address")?;
                    participant_addresses.insert(address);
                }

                let payload = MultiSigBuilder {
                    participants: participant_addresses,
                    threshold,
                };
                let transaction_type_builder = TransactionTypeBuilder::MultiSig(payload);

                let (tx, state) = {
                    let mut storage = self.wallet.get_storage().write().await;
                    self.wallet
                        .create_transaction_with_storage(
                            &mut storage,
                            transaction_type_builder.clone(),
                            FeeBuilder::default(),
                            BaseFeeMode::None,
                            None,
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
                ffi_exit!("multisig_setup", start_time, thread_id);
                result
            }
        }
    }

    #[frb(sync)]
    pub fn is_address_valid_for_multisig(&self, address: String) -> Result<bool> {
        let (start_time, thread_id) = ffi_entry!("is_address_valid_for_multisig");
        let address = match Address::from_string(&address) {
            Ok(address) => address,
            Err(_) => {
                warn!("Invalid address");
                ffi_exit!("is_address_valid_for_multisig", start_time, thread_id);
                return Ok(false);
            }
        };

        if !address.is_normal() {
            warn!("Address is not normal");
            ffi_exit!("is_address_valid_for_multisig", start_time, thread_id);
            return Ok(false);
        }

        let mainnet = self.wallet.get_network().is_mainnet();
        if address.is_mainnet() != mainnet {
            warn!("Address is not from the same network");
            ffi_exit!("is_address_valid_for_multisig", start_time, thread_id);
            return Ok(false);
        }

        if address.get_public_key() == self.wallet.get_public_key() {
            warn!("Address is the same as the wallet address");
            ffi_exit!("is_address_valid_for_multisig", start_time, thread_id);
            return Ok(false);
        }

        ffi_exit!("is_address_valid_for_multisig", start_time, thread_id);
        Ok(true)
    }

    pub async fn init_delete_multisig(&self) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("init_delete_multisig");
        info!("Deleting multisig...");
        let multisig = {
            let storage = self.wallet.get_storage().read().await;
            let multisig = storage
                .get_multisig_state()
                .await
                .context("Error while reading multisig state")?;
            multisig.cloned()
        };

        match multisig {
            Some(multisig) => {
                let payload = MultiSigBuilder {
                    participants: IndexSet::new(),
                    threshold: 0,
                };

                let transaction_type_builder = TransactionTypeBuilder::MultiSig(payload);

                let (unsigned, state) = self
                    .build_unsigned_transaction(
                        transaction_type_builder.clone(),
                        FeeBuilder::default(),
                        multisig.payload.threshold,
                    )
                    .await?;

                let hash = unsigned.get_hash_for_multisig().to_hex();

                let mut pending_unsigned = self.pending_unsigned.write();

                *pending_unsigned = Some((unsigned, state, transaction_type_builder));

                info!("Unsigned transaction created: {}", hash);

                ffi_exit!("init_delete_multisig", start_time, thread_id);
                Ok(hash)
            }
            None => {
                ffi_exit!("init_delete_multisig", start_time, thread_id);
                bail!("No multisig configured")
            }
        }
    }

    pub async fn finalize_multisig_transaction(
        &self,
        signatures: Vec<SignatureMultisig>,
    ) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("finalize_multisig_transaction");
        let mut signature_ids = Vec::new();
        for signature in signatures {
            let id = signature.id;
            let signature = Signature::from_hex(&signature.signature)
                .context(format!("Invalid signature for id: {}", id))?;
            signature_ids.push(SignatureId { id, signature });
        }

        let mut multisig = MultiSig::new();
        for signature in signature_ids {
            if !multisig.add_signature(signature) {
                ffi_exit!("finalize_multisig_transaction", start_time, thread_id);
                bail!("Invalid signature");
            }
        }

        let (mut unsigned, mut state, transaction_type_builder) = self
            .pending_unsigned
            .write()
            .take()
            .ok_or_else(|| anyhow!("No unsigned transaction available"))?;

        unsigned.set_multisig(multisig);

        let tx = unsigned.finalize(self.wallet.get_keypair());

        state.set_tx_hash_built(tx.hash());

        self.pending_transactions
            .write()
            .insert(tx.hash().clone(), (tx.clone(), state));

        let result = Ok(json!(SummaryTransaction {
            hash: tx.hash().to_hex(),
            fee: tx.get_fee(),
            transaction_type: transaction_type_builder,
        })
        .to_string());
        ffi_exit!("finalize_multisig_transaction", start_time, thread_id);
        result
    }

    #[frb(sync)]
    pub fn multisig_sign(&self, tx_hash: String) -> Result<String> {
        let (start_time, thread_id) = ffi_entry!("multisig_sign");
        let hash = Hash::from_hex(&tx_hash)?;
        let signature = self.wallet.sign_data(hash.as_bytes());
        let result = Ok(signature.to_hex());
        ffi_exit!("multisig_sign", start_time, thread_id);
        result
    }

    // ========================================================================
    // Private Methods
    // ========================================================================

    async fn build_unsigned_transaction(
        &self,
        tx_type: TransactionTypeBuilder,
        fee: FeeBuilder,
        threshold: u8,
    ) -> Result<(UnsignedTransaction, TransactionBuilderState)> {
        let storage = self.wallet.get_storage().write().await;
        let mut state = self
            .wallet
            .create_transaction_state_with_storage(
                &storage,
                &tx_type,
                fee,
                BaseFeeMode::None,
                None,
                None,
            )
            .await
            .context("Error while creating transaction state")?;

        let unsigned = self
            .wallet
            .create_unsigned_transaction(
                &mut state,
                Some(threshold),
                tx_type,
                fee,
                storage.get_tx_version().await?,
            )
            .context("Error while building unsigned transaction")?;
        info!(
            "Unsigned transaction created: {}",
            unsigned.get_hash_for_multisig()
        );
        Ok((unsigned, state))
    }

    async fn create_transfers(&self, transfers: Vec<Transfer>) -> Result<TransactionTypeBuilder> {
        let mut vec = Vec::new();

        for transfer in transfers {
            let asset = Hash::from_hex(&transfer.asset_hash).context("Invalid asset")?;

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
                encrypt_extra_data: transfer.encrypt_extra_data.unwrap_or(false),
            };

            vec.push(transfer_builder);
        }

        Ok(TransactionTypeBuilder::Transfers(vec))
    }

    async fn convert_float_amount(&self, float_amount: f64, asset: &Hash) -> Result<u64> {
        let storage = self.wallet.get_storage().read().await;
        let decimals = storage.get_asset(&asset).await?.get_decimals();
        let amount = (float_amount * 10u32.pow(decimals as u32) as f64) as u64;
        Ok(amount)
    }
}
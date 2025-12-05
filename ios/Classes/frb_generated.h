#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
// EXTRA BEGIN
typedef struct DartCObject *WireSyncRust2DartDco;
typedef struct WireSyncRust2DartSse {
  uint8_t *ptr;
  int32_t len;
} WireSyncRust2DartSse;

typedef int64_t DartPort;
typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);
void store_dart_post_cobject(DartPostCObjectFnType ptr);
// EXTRA END
typedef struct _Dart_Handle* Dart_Handle;

typedef struct wire_cst_list_prim_u_8_strict {
  uint8_t *ptr;
  int32_t len;
} wire_cst_list_prim_u_8_strict;

typedef struct wire_cst_list_String {
  struct wire_cst_list_prim_u_8_strict **ptr;
  int32_t len;
} wire_cst_list_String;

typedef struct wire_cst_transfer {
  double float_amount;
  struct wire_cst_list_prim_u_8_strict *str_address;
  struct wire_cst_list_prim_u_8_strict *asset_hash;
  struct wire_cst_list_prim_u_8_strict *extra_data;
} wire_cst_transfer;

typedef struct wire_cst_list_transfer {
  struct wire_cst_transfer *ptr;
  int32_t len;
} wire_cst_list_transfer;

typedef struct wire_cst_Report_TableGeneration {
  double progress;
  struct wire_cst_list_prim_u_8_strict *step;
  struct wire_cst_list_prim_u_8_strict *message;
} wire_cst_Report_TableGeneration;

typedef struct wire_cst_Report_Misc {
  struct wire_cst_list_prim_u_8_strict *message;
} wire_cst_Report_Misc;

typedef union ReportKind {
  struct wire_cst_Report_TableGeneration TableGeneration;
  struct wire_cst_Report_Misc Misc;
} ReportKind;

typedef struct wire_cst_report {
  int32_t tag;
  union ReportKind kind;
} wire_cst_report;

typedef struct wire_cst_xelis_asset_owner {
  struct wire_cst_list_prim_u_8_strict *contract;
  uint64_t id;
} wire_cst_xelis_asset_owner;

typedef struct wire_cst_record_string_string {
  struct wire_cst_list_prim_u_8_strict *field0;
  struct wire_cst_list_prim_u_8_strict *field1;
} wire_cst_record_string_string;

typedef struct wire_cst_list_record_string_string {
  struct wire_cst_record_string_string *ptr;
  int32_t len;
} wire_cst_list_record_string_string;

typedef struct wire_cst_record_string_u_64 {
  struct wire_cst_list_prim_u_8_strict *field0;
  uint64_t field1;
} wire_cst_record_string_u_64;

typedef struct wire_cst_list_record_string_u_64 {
  struct wire_cst_record_string_u_64 *ptr;
  int32_t len;
} wire_cst_list_record_string_u_64;

typedef struct wire_cst_xelis_asset_metadata {
  struct wire_cst_list_prim_u_8_strict *name;
  struct wire_cst_list_prim_u_8_strict *ticker;
  uint8_t decimals;
  uint64_t max_supply;
  struct wire_cst_xelis_asset_owner *owner;
} wire_cst_xelis_asset_metadata;

typedef struct wire_cst_record_string_xelis_asset_metadata {
  struct wire_cst_list_prim_u_8_strict *field0;
  struct wire_cst_xelis_asset_metadata field1;
} wire_cst_record_string_xelis_asset_metadata;

typedef struct wire_cst_list_record_string_xelis_asset_metadata {
  struct wire_cst_record_string_xelis_asset_metadata *ptr;
  int32_t len;
} wire_cst_list_record_string_xelis_asset_metadata;

typedef struct wire_cst_log_entry {
  int32_t level;
  struct wire_cst_list_prim_u_8_strict *tag;
  struct wire_cst_list_prim_u_8_strict *msg;
} wire_cst_log_entry;

typedef struct wire_cst_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_transaction_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_transaction_builder_state {
  uintptr_t field0;
  uintptr_t field1;
} wire_cst_record_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_transaction_auto_owned_rust_opaque_flutter_rust_bridgefor_generated_rust_auto_opaque_inner_transaction_builder_state;

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__seed_search_engine__SearchEngine_check_seed(uintptr_t that,
                                                                                                        struct wire_cst_list_String *seed);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__seed_search_engine__SearchEngine_init(uintptr_t language_index);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__seed_search_engine__SearchEngine_search(uintptr_t that,
                                                                                                    struct wire_cst_list_prim_u_8_strict *query);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__logger__SendToDartLogger_auto_accessor_get_level(uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__logger__SendToDartLogger_auto_accessor_set_level(uintptr_t that,
                                                                                                             uintptr_t level);

void frbgen_xelis_flutter_wire__crate__api__logger__SendToDartLogger_set_stream_sink(int64_t port_,
                                                                                     struct wire_cst_list_prim_u_8_strict *stream_sink);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_get_fee(uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_get_hash(uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_get_transaction_type(uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_set_fee(uintptr_t that,
                                                                                                             uint64_t fee);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_set_hash(uintptr_t that,
                                                                                                              struct wire_cst_list_prim_u_8_strict *hash);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_set_transaction_type(uintptr_t that,
                                                                                                                          uintptr_t transaction_type);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_all_history(int64_t port_,
                                                                            uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_broadcast_transaction(int64_t port_,
                                                                                      uintptr_t that,
                                                                                      struct wire_cst_list_prim_u_8_strict *tx_hash);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_change_password(int64_t port_,
                                                                                uintptr_t that,
                                                                                struct wire_cst_list_prim_u_8_strict *old_password,
                                                                                struct wire_cst_list_prim_u_8_strict *new_password);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_clear_transaction(uintptr_t that,
                                                                                                  struct wire_cst_list_prim_u_8_strict *tx_hash);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_close(int64_t port_,
                                                                      uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_convert_transactions_to_csv(int64_t port_,
                                                                                            uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_burn_all_transaction(int64_t port_,
                                                                                            uintptr_t that,
                                                                                            struct wire_cst_list_prim_u_8_strict *asset_hash);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_burn_transaction(int64_t port_,
                                                                                        uintptr_t that,
                                                                                        double float_amount,
                                                                                        struct wire_cst_list_prim_u_8_strict *asset_hash);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_transfer_all_transaction(int64_t port_,
                                                                                                uintptr_t that,
                                                                                                struct wire_cst_list_prim_u_8_strict *str_address,
                                                                                                struct wire_cst_list_prim_u_8_strict *asset_hash,
                                                                                                struct wire_cst_list_prim_u_8_strict *extra_data);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_transfers_transaction(int64_t port_,
                                                                                             uintptr_t that,
                                                                                             struct wire_cst_list_transfer *transfers);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_estimate_fees(int64_t port_,
                                                                              uintptr_t that,
                                                                              struct wire_cst_list_transfer *transfers);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_events_stream(int64_t port_,
                                                                              uintptr_t that,
                                                                              struct wire_cst_list_prim_u_8_strict *sink);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_export_transactions_to_csv_file(int64_t port_,
                                                                                                uintptr_t that,
                                                                                                struct wire_cst_list_prim_u_8_strict *file_path);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_format_coin(int64_t port_,
                                                                            uintptr_t that,
                                                                            uint64_t atomic_amount,
                                                                            struct wire_cst_list_prim_u_8_strict *asset_hash);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_address_str(uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_all_assets(int64_t port_,
                                                                               uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_balance_by_id(int64_t port_,
                                                                                        uintptr_t that,
                                                                                        struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_balance_by_id_raw(int64_t port_,
                                                                                            uintptr_t that,
                                                                                            struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_balances(int64_t port_,
                                                                                   uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_decimals(int64_t port_,
                                                                                   uintptr_t that,
                                                                                   struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_metadata(int64_t port_,
                                                                                   uintptr_t that,
                                                                                   struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_ticker(int64_t port_,
                                                                                 uintptr_t that,
                                                                                 struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_daemon_info(int64_t port_,
                                                                                uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_network(uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_nonce(int64_t port_,
                                                                          uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_seed(int64_t port_,
                                                                         uintptr_t that,
                                                                         uintptr_t *language_index);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_tracked_asset_balances_raw(int64_t port_,
                                                                                               uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_xelis_balance(int64_t port_,
                                                                                  uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_xelis_balance_raw(int64_t port_,
                                                                                      uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_has_xelis_balance(int64_t port_,
                                                                                  uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_asset_tracked(int64_t port_,
                                                                                 uintptr_t that,
                                                                                 struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_online(int64_t port_,
                                                                          uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_valid_password(int64_t port_,
                                                                                  uintptr_t that,
                                                                                  struct wire_cst_list_prim_u_8_strict *password);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_offline_mode(int64_t port_,
                                                                             uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_online_mode(int64_t port_,
                                                                            uintptr_t that,
                                                                            struct wire_cst_list_prim_u_8_strict *daemon_address);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_rescan(int64_t port_,
                                                                       uintptr_t that,
                                                                       uint64_t topoheight);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_track_asset(int64_t port_,
                                                                            uintptr_t that,
                                                                            struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_untrack_asset(int64_t port_,
                                                                              uintptr_t that,
                                                                              struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__progress_report__add_progress_report(int64_t port_,
                                                                                 struct wire_cst_report *report);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__clear_asset_cache(void);

void frbgen_xelis_flutter_wire__crate__api__api__create_log_stream(int64_t port_,
                                                                   struct wire_cst_list_prim_u_8_strict *s);

void frbgen_xelis_flutter_wire__crate__api__api__create_progress_report_stream(int64_t port_,
                                                                               struct wire_cst_list_prim_u_8_strict *stream_sink);

void frbgen_xelis_flutter_wire__crate__api__wallet__create_xelis_wallet(int64_t port_,
                                                                        struct wire_cst_list_prim_u_8_strict *name,
                                                                        struct wire_cst_list_prim_u_8_strict *directory,
                                                                        struct wire_cst_list_prim_u_8_strict *password,
                                                                        int32_t network,
                                                                        struct wire_cst_list_prim_u_8_strict *seed,
                                                                        struct wire_cst_list_prim_u_8_strict *private_key,
                                                                        struct wire_cst_list_prim_u_8_strict *precomputed_tables_path,
                                                                        uintptr_t *l1_size);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__drop_wallet(uintptr_t wallet);

void frbgen_xelis_flutter_wire__crate__api__utils__format_coin(int64_t port_,
                                                               uint64_t value,
                                                               uint8_t decimals);

void frbgen_xelis_flutter_wire__crate__api__utils__format_xelis(int64_t port_, uint64_t value);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__get_asset_cache_size(void);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__get_cached_table(void);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__utils__get_language_index_from_str(struct wire_cst_list_prim_u_8_strict *input);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__utils__get_mnemonic_words(uintptr_t language_index);

void frbgen_xelis_flutter_wire__crate__api__logger__init_logger(int64_t port_);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__utils__is_address_valid(struct wire_cst_list_prim_u_8_strict *str_address);

void frbgen_xelis_flutter_wire__crate__api__wallet__open_xelis_wallet(int64_t port_,
                                                                      struct wire_cst_list_prim_u_8_strict *name,
                                                                      struct wire_cst_list_prim_u_8_strict *directory,
                                                                      struct wire_cst_list_prim_u_8_strict *password,
                                                                      int32_t network,
                                                                      struct wire_cst_list_prim_u_8_strict *precomputed_tables_path,
                                                                      uintptr_t *l1_size);

void frbgen_xelis_flutter_wire__crate__api__table_generation__precomputed_tables_exist(int64_t port_,
                                                                                       struct wire_cst_list_prim_u_8_strict *precomputed_tables_path);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__refresh_mt_params(void);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__set_mt_params(uintptr_t thread_count,
                                                                                  uintptr_t concurrency);

void frbgen_xelis_flutter_wire__crate__api__api__set_up_rust_logger(int64_t port_);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__utils__split_integrated_address_json(struct wire_cst_list_prim_u_8_strict *integrated_address);

void frbgen_xelis_flutter_wire__crate__api__wallet__update_tables(int64_t port_,
                                                                  struct wire_cst_list_prim_u_8_strict *precomputed_tables_path,
                                                                  uintptr_t *l1_size);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLevelFilter(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLevelFilter(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPrecomputedTablesShared(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPrecomputedTablesShared(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSearchEngine(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSearchEngine(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSendToDartLogger(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSendToDartLogger(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSummaryTransaction(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSummaryTransaction(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransaction(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransaction(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionBuilderState(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionBuilderState(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionTypeBuilder(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionTypeBuilder(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerXelisWallet(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerXelisWallet(const void *ptr);

uintptr_t *frbgen_xelis_flutter_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPrecomputedTablesShared(uintptr_t value);

struct wire_cst_report *frbgen_xelis_flutter_cst_new_box_autoadd_report(void);

uintptr_t *frbgen_xelis_flutter_cst_new_box_autoadd_usize(uintptr_t value);

struct wire_cst_xelis_asset_owner *frbgen_xelis_flutter_cst_new_box_autoadd_xelis_asset_owner(void);

struct wire_cst_list_String *frbgen_xelis_flutter_cst_new_list_String(int32_t len);

struct wire_cst_list_prim_u_8_strict *frbgen_xelis_flutter_cst_new_list_prim_u_8_strict(int32_t len);

struct wire_cst_list_record_string_string *frbgen_xelis_flutter_cst_new_list_record_string_string(int32_t len);

struct wire_cst_list_record_string_u_64 *frbgen_xelis_flutter_cst_new_list_record_string_u_64(int32_t len);

struct wire_cst_list_record_string_xelis_asset_metadata *frbgen_xelis_flutter_cst_new_list_record_string_xelis_asset_metadata(int32_t len);

struct wire_cst_list_transfer *frbgen_xelis_flutter_cst_new_list_transfer(int32_t len);
static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPrecomputedTablesShared);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_report);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_usize);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_xelis_asset_owner);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_String);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_prim_u_8_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_record_string_string);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_record_string_u_64);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_record_string_xelis_asset_metadata);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_transfer);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLevelFilter);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPrecomputedTablesShared);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSearchEngine);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSendToDartLogger);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSummaryTransaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionBuilderState);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionTypeBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerXelisWallet);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLevelFilter);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPrecomputedTablesShared);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSearchEngine);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSendToDartLogger);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSummaryTransaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionBuilderState);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionTypeBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerXelisWallet);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__api__create_log_stream);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__api__create_progress_report_stream);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__api__set_up_rust_logger);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__logger__SendToDartLogger_auto_accessor_get_level);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__logger__SendToDartLogger_auto_accessor_set_level);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__logger__SendToDartLogger_set_stream_sink);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__logger__init_logger);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__progress_report__add_progress_report);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__seed_search_engine__SearchEngine_check_seed);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__seed_search_engine__SearchEngine_init);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__seed_search_engine__SearchEngine_search);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__table_generation__precomputed_tables_exist);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__format_coin);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__format_xelis);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__get_language_index_from_str);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__get_mnemonic_words);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__is_address_valid);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__split_integrated_address_json);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_get_fee);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_get_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_get_transaction_type);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_set_fee);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_set_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__SummaryTransaction_auto_accessor_set_transaction_type);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_all_history);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_broadcast_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_change_password);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_clear_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_close);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_convert_transactions_to_csv);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_burn_all_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_burn_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_transfer_all_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_transfers_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_estimate_fees);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_events_stream);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_export_transactions_to_csv_file);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_format_coin);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_address_str);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_all_assets);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_balance_by_id);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_balance_by_id_raw);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_balances);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_decimals);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_metadata);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_ticker);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_daemon_info);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_network);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_nonce);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_seed);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_tracked_asset_balances_raw);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_xelis_balance);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_xelis_balance_raw);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_has_xelis_balance);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_asset_tracked);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_online);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_valid_password);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_offline_mode);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_online_mode);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_rescan);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_track_asset);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_untrack_asset);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__clear_asset_cache);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__create_xelis_wallet);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__drop_wallet);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__get_asset_cache_size);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__get_cached_table);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__open_xelis_wallet);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__refresh_mt_params);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__set_mt_params);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__update_tables);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}

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
  bool *encrypt_extra_data;
} wire_cst_transfer;

typedef struct wire_cst_list_transfer {
  struct wire_cst_transfer *ptr;
  int32_t len;
} wire_cst_list_transfer;

typedef struct wire_cst_signature_multisig {
  uint8_t id;
  struct wire_cst_list_prim_u_8_strict *signature;
} wire_cst_signature_multisig;

typedef struct wire_cst_list_signature_multisig {
  struct wire_cst_signature_multisig *ptr;
  int32_t len;
} wire_cst_list_signature_multisig;

typedef struct wire_cst_history_page_filter {
  uintptr_t page;
  uintptr_t *limit;
  struct wire_cst_list_prim_u_8_strict *asset_hash;
  struct wire_cst_list_prim_u_8_strict *address;
  uint64_t *min_topoheight;
  uint64_t *max_topoheight;
  bool accept_incoming;
  bool accept_outgoing;
  bool accept_coinbase;
  bool accept_burn;
} wire_cst_history_page_filter;

typedef struct wire_cst_record_string_permission_policy {
  struct wire_cst_list_prim_u_8_strict *field0;
  int32_t field1;
} wire_cst_record_string_permission_policy;

typedef struct wire_cst_list_record_string_permission_policy {
  struct wire_cst_record_string_permission_policy *ptr;
  int32_t len;
} wire_cst_list_record_string_permission_policy;

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

typedef struct wire_cst_contact_details {
  struct wire_cst_list_prim_u_8_strict *name;
  struct wire_cst_list_prim_u_8_strict *address;
  struct wire_cst_list_prim_u_8_strict *note;
} wire_cst_contact_details;

typedef struct wire_cst_record_string_contact_details {
  struct wire_cst_list_prim_u_8_strict *field0;
  struct wire_cst_contact_details field1;
} wire_cst_record_string_contact_details;

typedef struct wire_cst_list_record_string_contact_details {
  struct wire_cst_record_string_contact_details *ptr;
  int32_t len;
} wire_cst_list_record_string_contact_details;

typedef struct wire_cst_address_book_data {
  struct wire_cst_list_record_string_contact_details *contacts;
} wire_cst_address_book_data;

typedef struct wire_cst_PrecomputedTableType_Custom {
  uintptr_t field0;
} wire_cst_PrecomputedTableType_Custom;

typedef union PrecomputedTableTypeKind {
  struct wire_cst_PrecomputedTableType_Custom Custom;
} PrecomputedTableTypeKind;

typedef struct wire_cst_precomputed_table_type {
  int32_t tag;
  union PrecomputedTableTypeKind kind;
} wire_cst_precomputed_table_type;

typedef struct wire_cst_XswdRequestType_Permission {
  struct wire_cst_list_prim_u_8_strict *field0;
} wire_cst_XswdRequestType_Permission;

typedef union XswdRequestTypeKind {
  struct wire_cst_XswdRequestType_Permission Permission;
} XswdRequestTypeKind;

typedef struct wire_cst_xswd_request_type {
  int32_t tag;
  union XswdRequestTypeKind kind;
} wire_cst_xswd_request_type;

typedef struct wire_cst_app_info {
  struct wire_cst_list_prim_u_8_strict *id;
  struct wire_cst_list_prim_u_8_strict *name;
  struct wire_cst_list_prim_u_8_strict *description;
  struct wire_cst_list_prim_u_8_strict *url;
  struct wire_cst_list_record_string_permission_policy *permissions;
} wire_cst_app_info;

typedef struct wire_cst_xswd_request_summary {
  struct wire_cst_xswd_request_type event_type;
  struct wire_cst_app_info application_info;
} wire_cst_xswd_request_summary;

typedef struct wire_cst_XelisAssetOwner_Creator {
  struct wire_cst_list_prim_u_8_strict *contract;
  uint64_t id;
} wire_cst_XelisAssetOwner_Creator;

typedef struct wire_cst_XelisAssetOwner_Owner {
  struct wire_cst_list_prim_u_8_strict *origin;
  uint64_t origin_id;
  struct wire_cst_list_prim_u_8_strict *owner;
} wire_cst_XelisAssetOwner_Owner;

typedef union XelisAssetOwnerKind {
  struct wire_cst_XelisAssetOwner_Creator Creator;
  struct wire_cst_XelisAssetOwner_Owner Owner;
} XelisAssetOwnerKind;

typedef struct wire_cst_xelis_asset_owner {
  int32_t tag;
  union XelisAssetOwnerKind kind;
} wire_cst_xelis_asset_owner;

typedef struct wire_cst_list_app_info {
  struct wire_cst_app_info *ptr;
  int32_t len;
} wire_cst_list_app_info;

typedef struct wire_cst_list_contact_details {
  struct wire_cst_contact_details *ptr;
  int32_t len;
} wire_cst_list_contact_details;

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

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__IntegratedAddress_auto_accessor_get_address(uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__IntegratedAddress_auto_accessor_get_data(uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__IntegratedAddress_auto_accessor_set_address(uintptr_t that,
                                                                                                                             uintptr_t address);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__IntegratedAddress_auto_accessor_set_data(uintptr_t that,
                                                                                                                          uintptr_t *data);

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

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_get_fee(uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_get_hash(uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_get_transaction_type(uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_set_fee(uintptr_t that,
                                                                                                                          uint64_t fee);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_set_hash(uintptr_t that,
                                                                                                                           struct wire_cst_list_prim_u_8_strict *hash);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_set_transaction_type(uintptr_t that,
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

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_close_application_session(int64_t port_,
                                                                                          uintptr_t that,
                                                                                          struct wire_cst_list_prim_u_8_strict *id);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_convert_transactions_to_csv(int64_t port_,
                                                                                            uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_burn_all_transaction(int64_t port_,
                                                                                            uintptr_t that,
                                                                                            struct wire_cst_list_prim_u_8_strict *asset_hash);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_burn_transaction(int64_t port_,
                                                                                        uintptr_t that,
                                                                                        double float_amount,
                                                                                        struct wire_cst_list_prim_u_8_strict *asset_hash);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_multisig_burn_all_transaction(int64_t port_,
                                                                                                     uintptr_t that,
                                                                                                     struct wire_cst_list_prim_u_8_strict *asset_hash);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_multisig_burn_transaction(int64_t port_,
                                                                                                 uintptr_t that,
                                                                                                 double float_amount,
                                                                                                 struct wire_cst_list_prim_u_8_strict *asset_hash);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_multisig_transfer_all_transaction(int64_t port_,
                                                                                                         uintptr_t that,
                                                                                                         struct wire_cst_list_prim_u_8_strict *str_address,
                                                                                                         struct wire_cst_list_prim_u_8_strict *asset_hash,
                                                                                                         struct wire_cst_list_prim_u_8_strict *extra_data,
                                                                                                         bool *encrypt_extra_data);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_multisig_transfers_transaction(int64_t port_,
                                                                                                      uintptr_t that,
                                                                                                      struct wire_cst_list_transfer *transfers);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_transfer_all_transaction(int64_t port_,
                                                                                                uintptr_t that,
                                                                                                struct wire_cst_list_prim_u_8_strict *str_address,
                                                                                                struct wire_cst_list_prim_u_8_strict *asset_hash,
                                                                                                struct wire_cst_list_prim_u_8_strict *extra_data,
                                                                                                bool *encrypt_extra_data);

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

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_finalize_multisig_transaction(int64_t port_,
                                                                                              uintptr_t that,
                                                                                              struct wire_cst_list_signature_multisig *signatures);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_format_coin(int64_t port_,
                                                                            uintptr_t that,
                                                                            uint64_t atomic_amount,
                                                                            struct wire_cst_list_prim_u_8_strict *asset_hash);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_address_str(uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_all_assets(int64_t port_,
                                                                               uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_application_permissions(int64_t port_,
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

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_history_count(int64_t port_,
                                                                                  uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_known_assets(int64_t port_,
                                                                                 uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_multisig_state(int64_t port_,
                                                                                   uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_network(uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_nonce(int64_t port_,
                                                                          uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_seed(int64_t port_,
                                                                         uintptr_t that,
                                                                         uintptr_t *language_index);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_tracked_asset_balances_raw(int64_t port_,
                                                                                               uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_tracked_balances(int64_t port_,
                                                                                     uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_xelis_balance(int64_t port_,
                                                                                  uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_xelis_balance_raw(int64_t port_,
                                                                                      uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_has_asset_balance(int64_t port_,
                                                                                  uintptr_t that,
                                                                                  struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_has_xelis_balance(int64_t port_,
                                                                                  uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_history(int64_t port_,
                                                                        uintptr_t that,
                                                                        struct wire_cst_history_page_filter *filter);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_init_delete_multisig(int64_t port_,
                                                                                     uintptr_t that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_address_valid_for_multisig(uintptr_t that,
                                                                                                              struct wire_cst_list_prim_u_8_strict *address);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_asset_tracked(int64_t port_,
                                                                                 uintptr_t that,
                                                                                 struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_online(int64_t port_,
                                                                          uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_valid_password(int64_t port_,
                                                                                  uintptr_t that,
                                                                                  struct wire_cst_list_prim_u_8_strict *password);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_xswd_running(int64_t port_,
                                                                                uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_modify_application_permissions(int64_t port_,
                                                                                               uintptr_t that,
                                                                                               struct wire_cst_list_prim_u_8_strict *id,
                                                                                               struct wire_cst_list_record_string_permission_policy *permissions);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_multisig_setup(int64_t port_,
                                                                               uintptr_t that,
                                                                               uint8_t threshold,
                                                                               struct wire_cst_list_String *participants);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_multisig_sign(uintptr_t that,
                                                                                              struct wire_cst_list_prim_u_8_strict *tx_hash);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_offline_mode(int64_t port_,
                                                                             uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_online_mode(int64_t port_,
                                                                            uintptr_t that,
                                                                            struct wire_cst_list_prim_u_8_strict *daemon_address);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_rescan(int64_t port_,
                                                                       uintptr_t that,
                                                                       uint64_t topoheight);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_start_xswd(int64_t port_,
                                                                           uintptr_t that,
                                                                           const void *cancel_request_dart_callback,
                                                                           const void *request_application_dart_callback,
                                                                           const void *request_permission_dart_callback,
                                                                           const void *app_disconnect_dart_callback);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_stop_xswd(int64_t port_,
                                                                          uintptr_t that);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_track_asset(int64_t port_,
                                                                            uintptr_t that,
                                                                            struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_untrack_asset(int64_t port_,
                                                                              uintptr_t that,
                                                                              struct wire_cst_list_prim_u_8_strict *asset);

void frbgen_xelis_flutter_wire__crate__api__progress_report__add_progress_report(int64_t port_,
                                                                                 struct wire_cst_report *report);

void frbgen_xelis_flutter_wire__crate__api__models__address_book_dtos__address_book_data_get_all_entries(int64_t port_,
                                                                                                         struct wire_cst_address_book_data *that);

void frbgen_xelis_flutter_wire__crate__api__precomputed_tables__are_precomputed_tables_available(int64_t port_,
                                                                                                 struct wire_cst_list_prim_u_8_strict *precomputed_tables_path,
                                                                                                 struct wire_cst_precomputed_table_type *precomputed_table_type);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__clear_asset_cache(void);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__clear_cached_tables(void);

void frbgen_xelis_flutter_wire__crate__api__xswd__imp__create_app_info(int64_t port_,
                                                                       uintptr_t state);

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
                                                                        struct wire_cst_precomputed_table_type *precomputed_table_type);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__drop_wallet(uintptr_t wallet);

void frbgen_xelis_flutter_wire__crate__api__utils__format_coin(int64_t port_,
                                                               uint64_t value,
                                                               uint8_t decimals);

void frbgen_xelis_flutter_wire__crate__api__utils__format_xelis(int64_t port_, uint64_t value);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__get_asset_cache_size(void);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__get_cached_table(void);

void frbgen_xelis_flutter_wire__crate__api__wallet__get_current_precomputed_tables_type(int64_t port_);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__utils__get_language_index_from_str(struct wire_cst_list_prim_u_8_strict *input);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__utils__get_mnemonic_words(uintptr_t language_index);

void frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__history_page_filter_default(int64_t port_);

void frbgen_xelis_flutter_wire__crate__api__logger__init_logger(int64_t port_);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__utils__is_address_valid(struct wire_cst_list_prim_u_8_strict *str_address);

void frbgen_xelis_flutter_wire__crate__api__wallet__open_xelis_wallet(int64_t port_,
                                                                      struct wire_cst_list_prim_u_8_strict *name,
                                                                      struct wire_cst_list_prim_u_8_strict *directory,
                                                                      struct wire_cst_list_prim_u_8_strict *password,
                                                                      int32_t network,
                                                                      struct wire_cst_list_prim_u_8_strict *precomputed_tables_path,
                                                                      struct wire_cst_precomputed_table_type *precomputed_table_type);

void frbgen_xelis_flutter_wire__crate__api__precomputed_tables__precomputed_table_type_index(int64_t port_,
                                                                                             struct wire_cst_precomputed_table_type *that);

void frbgen_xelis_flutter_wire__crate__api__precomputed_tables__precomputed_table_type_name(int64_t port_,
                                                                                            struct wire_cst_precomputed_table_type *that);

void frbgen_xelis_flutter_wire__crate__api__precomputed_tables__precomputed_table_type_to_l1_size(int64_t port_,
                                                                                                  struct wire_cst_precomputed_table_type *that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__refresh_mt_params(void);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__wallet__set_mt_params(uintptr_t thread_count,
                                                                                  uintptr_t concurrency);

void frbgen_xelis_flutter_wire__crate__api__api__set_up_rust_logger(int64_t port_);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__utils__split_integrated_address_json(struct wire_cst_list_prim_u_8_strict *integrated_address);

void frbgen_xelis_flutter_wire__crate__api__wallet__update_tables(int64_t port_,
                                                                  struct wire_cst_list_prim_u_8_strict *precomputed_tables_path,
                                                                  struct wire_cst_precomputed_table_type *precomputed_table_type);

void frbgen_xelis_flutter_wire__crate__api__xswd__imp__xswd_handler(int64_t port_,
                                                                    uintptr_t receiver,
                                                                    const void *cancel_request_dart_callback,
                                                                    const void *request_application_dart_callback,
                                                                    const void *request_permission_dart_callback,
                                                                    const void *app_disconnect_dart_callback);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__xswd_dtos__xswd_request_summary_is_app_disconnect(struct wire_cst_xswd_request_summary *that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__xswd_dtos__xswd_request_summary_is_application_request(struct wire_cst_xswd_request_summary *that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__xswd_dtos__xswd_request_summary_is_cancel_request(struct wire_cst_xswd_request_summary *that);

WireSyncRust2DartDco frbgen_xelis_flutter_wire__crate__api__models__xswd_dtos__xswd_request_summary_is_permission_request(struct wire_cst_xswd_request_summary *that);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAddress(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAddress(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAppState(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAppState(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerDataElement(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerDataElement(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerIntegratedAddress(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerIntegratedAddress(const void *ptr);

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

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUnboundedReceiverXSWDEvent(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUnboundedReceiverXSWDEvent(const void *ptr);

void frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerXelisWallet(const void *ptr);

void frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerXelisWallet(const void *ptr);

uintptr_t *frbgen_xelis_flutter_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerDataElement(uintptr_t value);

uintptr_t *frbgen_xelis_flutter_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPrecomputedTablesShared(uintptr_t value);

struct wire_cst_address_book_data *frbgen_xelis_flutter_cst_new_box_autoadd_address_book_data(void);

bool *frbgen_xelis_flutter_cst_new_box_autoadd_bool(bool value);

struct wire_cst_history_page_filter *frbgen_xelis_flutter_cst_new_box_autoadd_history_page_filter(void);

struct wire_cst_precomputed_table_type *frbgen_xelis_flutter_cst_new_box_autoadd_precomputed_table_type(void);

struct wire_cst_report *frbgen_xelis_flutter_cst_new_box_autoadd_report(void);

uint64_t *frbgen_xelis_flutter_cst_new_box_autoadd_u_64(uint64_t value);

uintptr_t *frbgen_xelis_flutter_cst_new_box_autoadd_usize(uintptr_t value);

struct wire_cst_xelis_asset_owner *frbgen_xelis_flutter_cst_new_box_autoadd_xelis_asset_owner(void);

struct wire_cst_xswd_request_summary *frbgen_xelis_flutter_cst_new_box_autoadd_xswd_request_summary(void);

struct wire_cst_list_String *frbgen_xelis_flutter_cst_new_list_String(int32_t len);

struct wire_cst_list_app_info *frbgen_xelis_flutter_cst_new_list_app_info(int32_t len);

struct wire_cst_list_contact_details *frbgen_xelis_flutter_cst_new_list_contact_details(int32_t len);

struct wire_cst_list_prim_u_8_strict *frbgen_xelis_flutter_cst_new_list_prim_u_8_strict(int32_t len);

struct wire_cst_list_record_string_contact_details *frbgen_xelis_flutter_cst_new_list_record_string_contact_details(int32_t len);

struct wire_cst_list_record_string_permission_policy *frbgen_xelis_flutter_cst_new_list_record_string_permission_policy(int32_t len);

struct wire_cst_list_record_string_string *frbgen_xelis_flutter_cst_new_list_record_string_string(int32_t len);

struct wire_cst_list_record_string_u_64 *frbgen_xelis_flutter_cst_new_list_record_string_u_64(int32_t len);

struct wire_cst_list_record_string_xelis_asset_metadata *frbgen_xelis_flutter_cst_new_list_record_string_xelis_asset_metadata(int32_t len);

struct wire_cst_list_signature_multisig *frbgen_xelis_flutter_cst_new_list_signature_multisig(int32_t len);

struct wire_cst_list_transfer *frbgen_xelis_flutter_cst_new_list_transfer(int32_t len);
static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerDataElement);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPrecomputedTablesShared);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_address_book_data);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_bool);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_history_page_filter);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_precomputed_table_type);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_report);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_u_64);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_usize);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_xelis_asset_owner);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_box_autoadd_xswd_request_summary);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_String);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_app_info);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_contact_details);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_prim_u_8_strict);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_record_string_contact_details);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_record_string_permission_policy);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_record_string_string);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_record_string_u_64);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_record_string_xelis_asset_metadata);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_signature_multisig);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_cst_new_list_transfer);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAddress);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAppState);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerDataElement);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerIntegratedAddress);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLevelFilter);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPrecomputedTablesShared);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSearchEngine);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSendToDartLogger);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSummaryTransaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionBuilderState);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionTypeBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUnboundedReceiverXSWDEvent);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerXelisWallet);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAddress);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerAppState);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerDataElement);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerIntegratedAddress);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLevelFilter);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPrecomputedTablesShared);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSearchEngine);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSendToDartLogger);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerSummaryTransaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionBuilderState);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerTransactionTypeBuilder);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerUnboundedReceiverXSWDEvent);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerXelisWallet);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__api__create_log_stream);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__api__create_progress_report_stream);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__api__set_up_rust_logger);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__logger__SendToDartLogger_auto_accessor_get_level);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__logger__SendToDartLogger_auto_accessor_set_level);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__logger__SendToDartLogger_set_stream_sink);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__logger__init_logger);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__address_book_dtos__address_book_data_get_all_entries);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__IntegratedAddress_auto_accessor_get_address);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__IntegratedAddress_auto_accessor_get_data);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__IntegratedAddress_auto_accessor_set_address);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__IntegratedAddress_auto_accessor_set_data);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_get_fee);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_get_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_get_transaction_type);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_set_fee);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_set_hash);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__SummaryTransaction_auto_accessor_set_transaction_type);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__wallet_dtos__history_page_filter_default);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__xswd_dtos__xswd_request_summary_is_app_disconnect);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__xswd_dtos__xswd_request_summary_is_application_request);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__xswd_dtos__xswd_request_summary_is_cancel_request);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__models__xswd_dtos__xswd_request_summary_is_permission_request);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__precomputed_tables__are_precomputed_tables_available);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__precomputed_tables__precomputed_table_type_index);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__precomputed_tables__precomputed_table_type_name);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__precomputed_tables__precomputed_table_type_to_l1_size);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__progress_report__add_progress_report);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__seed_search_engine__SearchEngine_check_seed);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__seed_search_engine__SearchEngine_init);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__seed_search_engine__SearchEngine_search);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__format_coin);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__format_xelis);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__get_language_index_from_str);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__get_mnemonic_words);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__is_address_valid);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__utils__split_integrated_address_json);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_all_history);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_broadcast_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_change_password);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_clear_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_close);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_close_application_session);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_convert_transactions_to_csv);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_burn_all_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_burn_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_multisig_burn_all_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_multisig_burn_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_multisig_transfer_all_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_multisig_transfers_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_transfer_all_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_create_transfers_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_estimate_fees);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_events_stream);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_export_transactions_to_csv_file);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_finalize_multisig_transaction);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_format_coin);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_address_str);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_all_assets);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_application_permissions);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_balance_by_id);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_balance_by_id_raw);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_balances);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_decimals);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_metadata);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_asset_ticker);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_daemon_info);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_history_count);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_known_assets);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_multisig_state);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_network);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_nonce);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_seed);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_tracked_asset_balances_raw);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_tracked_balances);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_xelis_balance);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_get_xelis_balance_raw);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_has_asset_balance);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_has_xelis_balance);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_history);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_init_delete_multisig);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_address_valid_for_multisig);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_asset_tracked);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_online);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_valid_password);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_is_xswd_running);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_modify_application_permissions);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_multisig_setup);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_multisig_sign);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_offline_mode);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_online_mode);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_rescan);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_start_xswd);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_stop_xswd);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_track_asset);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__XelisWallet_untrack_asset);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__clear_asset_cache);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__clear_cached_tables);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__create_xelis_wallet);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__drop_wallet);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__get_asset_cache_size);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__get_cached_table);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__get_current_precomputed_tables_type);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__open_xelis_wallet);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__refresh_mt_params);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__set_mt_params);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__wallet__update_tables);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__xswd__imp__create_app_info);
    dummy_var ^= ((int64_t) (void*) frbgen_xelis_flutter_wire__crate__api__xswd__imp__xswd_handler);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    return dummy_var;
}

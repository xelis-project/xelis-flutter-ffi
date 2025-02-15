// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.8.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import '../lib.dart';
import 'network.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These functions are ignored because they are not marked as `pub`: `convert_float_amount`, `create_transfers`
// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `clone`, `clone`, `fmt`, `fmt`

PrecomputedTablesShared? getCachedTable() =>
    RustLib.instance.api.crateApiWalletGetCachedTable();

Future<XelisWallet> createXelisWallet(
        {required String name,
        required String directory,
        required String password,
        required Network network,
        String? seed,
        String? privateKey,
        String? precomputedTablesPath,
        bool? l1Low}) =>
    RustLib.instance.api.crateApiWalletCreateXelisWallet(
        name: name,
        directory: directory,
        password: password,
        network: network,
        seed: seed,
        privateKey: privateKey,
        precomputedTablesPath: precomputedTablesPath,
        l1Low: l1Low);

Future<void> updateTables(
        {required String precomputedTablesPath, required bool l1Low}) =>
    RustLib.instance.api.crateApiWalletUpdateTables(
        precomputedTablesPath: precomputedTablesPath, l1Low: l1Low);

Future<XelisWallet> openXelisWallet(
        {required String name,
        required String directory,
        required String password,
        required Network network,
        String? precomputedTablesPath,
        bool? l1Low}) =>
    RustLib.instance.api.crateApiWalletOpenXelisWallet(
        name: name,
        directory: directory,
        password: password,
        network: network,
        precomputedTablesPath: precomputedTablesPath,
        l1Low: l1Low);

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<PrecomputedTablesShared>>
abstract class PrecomputedTablesShared implements RustOpaqueInterface {}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<SummaryTransaction>>
abstract class SummaryTransaction implements RustOpaqueInterface {
  BigInt get fee;

  String get hash;

  TransactionTypeBuilder get transactionType;

  set fee(BigInt fee);

  set hash(String hash);

  set transactionType(TransactionTypeBuilder transactionType);
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<Transaction>>
abstract class Transaction implements RustOpaqueInterface {}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<TransactionBuilderState>>
abstract class TransactionBuilderState implements RustOpaqueInterface {}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<XelisWallet>>
abstract class XelisWallet implements RustOpaqueInterface {
  Future<List<String>> allHistory();

  Future<void> broadcastTransaction({required String txHash});

  Future<void> changePassword(
      {required String oldPassword, required String newPassword});

  Future<(Transaction, TransactionBuilderState)> clearTransaction(
      {required String txHash});

  Future<void> close();

  Future<String> convertTransactionsToCsv();

  Future<String> createBurnAllTransaction({required String assetHash});

  Future<String> createBurnTransaction(
      {required double floatAmount, required String assetHash});

  Future<String> createTransferAllTransaction(
      {required String strAddress, String? assetHash, String? extraData});

  Future<String> createTransfersTransaction(
      {required List<Transfer> transfers});

  Future<String> estimateFees({required List<Transfer> transfers});

  Stream<String> eventsStream();

  Future<void> exportTransactionsToCsvFile({required String filePath});

  Future<String> formatCoin({required BigInt atomicAmount, String? assetHash});

  String getAddressStr();

  Future<Map<String, String>> getAssetBalances();

  Future<Map<String, BigInt>> getAssetBalancesRaw();

  Future<int> getAssetDecimals({required String asset});

  Future<String> getDaemonInfo();

  String getNetwork();

  Future<BigInt> getNonce();

  Future<String> getSeed({BigInt? languageIndex});

  Future<String> getXelisBalance();

  Future<BigInt> getXelisBalanceRaw();

  Future<bool> hasXelisBalance();

  Future<bool> isOnline();

  Future<void> isValidPassword({required String password});

  Future<void> offlineMode();

  Future<void> onlineMode({required String daemonAddress});

  Future<void> rescan({required BigInt topoheight});
}

class Transfer {
  final double floatAmount;
  final String strAddress;
  final String assetHash;
  final String? extraData;

  const Transfer({
    required this.floatAmount,
    required this.strAddress,
    required this.assetHash,
    this.extraData,
  });

  @override
  int get hashCode =>
      floatAmount.hashCode ^
      strAddress.hashCode ^
      assetHash.hashCode ^
      extraData.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transfer &&
          runtimeType == other.runtimeType &&
          floatAmount == other.floatAmount &&
          strAddress == other.strAddress &&
          assetHash == other.assetHash &&
          extraData == other.extraData;
}

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:xelis_flutter/src/api/network.dart';
import 'package:xelis_flutter/src/api/precomputed_tables.dart';
import 'package:xelis_flutter/src/api/wallet.dart' as x_wallet;
import 'package:xelis_flutter/src/frb_generated.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async => await RustLib.init());

  test('Can create a wallet and retrieve its seed', () async {
    final dir =
        '${Directory.systemTemp.path}${Platform.pathSeparator}xelis_test_wallet';
    final tablesDir =
        '$dir${Platform.pathSeparator}tables${Platform.pathSeparator}';

    final wallet = await x_wallet.createXelisWallet(
      name: 'Test Wallet',
      directory: dir,
      password: 'password',
      network: Network.mainnet,
      precomputedTablesPath: tablesDir,
      precomputedTableType: const PrecomputedTableType.l1Low(),
    );

    final seed = await wallet.getSeed();
    expect(seed, isNotEmpty);
  });
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xelis_flutter/src/frb_generated.dart';
import 'package:xelis_flutter/src/api/wallet.dart' as x_wallet;
import 'package:xelis_flutter/src/api/network.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? seed;
  String? currentDir;
  String? tableDir;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _getSeed();
  }

  Future<void> _getSeed() async {
    try {
      currentDir = "${Directory.current.path}${Platform.pathSeparator}example_data";
      tableDir = "${currentDir}${Platform.pathSeparator}tables${Platform.pathSeparator}";

      final wallet = await x_wallet.createXelisWallet(
        name: "Test Wallet",
        directory: currentDir!,
        password: "password",
        network: Network.mainnet,
        precomputedTablesPath: tableDir!,
      );

      final mnemonic = await wallet.getSeed();

      setState(() {
        seed = mnemonic;
        loading = false;
      });
    } catch (e) {
      setState(() {
        seed = "Failed to create wallet: $e";
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: loading
              ? const CircularProgressIndicator()
              : Text('Created Xelis wallet with mnemonic:\n$seed\n\nTable Path: $tableDir'),
        ),
      ),
    );
  }
}

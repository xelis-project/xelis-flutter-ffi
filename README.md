<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Xelis Wallet FFI Bindings for Flutter
This repo is setup to be a shoe-in library in flutter applications, allowing easy access to the native Rust wallet methods from `xelis-blockchain` without the need for any rewrites. This is enabled by the `flutter_rust_bridge_codegen` tool, as well as the automated build & dependency conventions used within this repository. 

The continued adoption of Genesix features and dev QOL needs for apps are the primary points of focus for this library, helping to facilitate Xelis integration and adoption for the community.

## Getting started
To make use of `xelis-flutter-ffi`, simply add a git dependency to your flutter app's `pubspec.yaml`, like this:

```yaml
xelis_flutter:
  git:
    url: https://github.com/xelis-project/xelis-flutter-ffi.git
    ref: v0.1.0 # release tags will be attributed to specific xelis-blockchain releases going forward
```

When either `flutter run` or `flutter build` are called, this library will handle all dependency building and/or Podspec operations for you, without the need for any extra setup.

The FFI bindings are updated and included in the repo; there is no need to regenerate them on your end unless you modify the files in `rust/`.
## Usage

In your app's `main` entry point, be sure to initialize the RustLib. This will enable the use of imported bindings anywhere in your app.
```dart
import 'package:xelis_flutter/src/frb_generated.dart' as xelis_flutter; // name required if the app uses multiple FFI libraries

Future<void> main() async {
  await xelis_flutter.RustLib.init();
  // ... Rest of your main() code
}
```

Here is an example of using the api crate through FFI to create a Xelis Wallet instance.
```dart
import 'package:xelis_flutter/src/api/wallet.dart' as x_wallet;
import 'package:xelis_flutter/src/api/network.dart' as x_network;

Future<void> createXelisWallet() async {
  final String name = "example-wallet";
  final String directory = "<local app path for xelis files>";
  final String password = "password";

  final wallet = await x_wallet.createXelisWallet(
    name: name,
    directory: directory, // local wallet data on the Rust side will be stored under directory/name/
    password: password,
    network: x_network.Network.mainnet,
    precomputedTablesPath: directory, // precomputed tables will be written to this location
    l1Low: true, // will generate lightweight precomputed tables, use false for full-sized tables
  );

  final mnemonic = await wallet.getSeed();

  // ... use wallet and mnemonic as required
}
```

## Additional information

The [Xelis Dart SDK](https://github.com/xelis-project/xelis-dart-sdk) is a dependency of this but is also a great tool to use alongside this library (as a direct dependency in your flutter app). It can be used for more direct RPC queries, health checks, data serialization, and more.
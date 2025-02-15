#!/usr/bin/env bash
set -ex

# Always navigate to the script's directory first
cd "$(dirname "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$PWD"

REQUIRED_VERSION="1.84.0"
CURRENT_VERSION=$(rustc --version | cut -d ' ' -f 2)

BUILD_DIR="$SCRIPT_DIR/build"
mkdir -p "$BUILD_DIR"

if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$CURRENT_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    echo "Updating Rust to version $REQUIRED_VERSION or higher (current: $CURRENT_VERSION)"
    rustup update $REQUIRED_VERSION
    rustup default $REQUIRED_VERSION
fi

# Find rust directory (2 directory levels up from script location)
cd "$SCRIPT_DIR/../.."
PROJECT_ROOT="$PWD" 
RUST_DIR="$PROJECT_ROOT/rust"

# Go to build directory and copy rust code
cd "$BUILD_DIR"
rm -rf rust
cp -rf "$RUST_DIR" ./rust
cd rust

# Build static libs
for TARGET in \
        aarch64-apple-ios x86_64-apple-ios aarch64-apple-ios-sim \
        x86_64-apple-darwin aarch64-apple-darwin
do
    rustup target add $TARGET
    cargo build -r --target=$TARGET
done

# Move back to build directory
cd "$BUILD_DIR"

# Create XCFramework zip
FRAMEWORK="XelisFlutter.xcframework"
LIBNAME=libxelis_flutter.a
mkdir -p mac-lipo ios-sim-lipo
IOS_SIM_LIPO=ios-sim-lipo/$LIBNAME
MAC_LIPO=mac-lipo/$LIBNAME
lipo -create -output $IOS_SIM_LIPO \
        rust/target/aarch64-apple-ios-sim/release/$LIBNAME \
        rust/target/x86_64-apple-ios/release/$LIBNAME
lipo -create -output $MAC_LIPO \
        rust/target/aarch64-apple-darwin/release/$LIBNAME \
        rust/target/x86_64-apple-darwin/release/$LIBNAME
xcodebuild -create-xcframework \
        -library $IOS_SIM_LIPO \
        -library $MAC_LIPO \
        -library rust/target/aarch64-apple-ios/release/$LIBNAME \
        -output $FRAMEWORK
zip -r $FRAMEWORK.zip $FRAMEWORK

# Cleanup
rm -rf ios-sim-lipo mac-lipo $FRAMEWORK

echo "Built XCFramework at $BUILD_DIR/$FRAMEWORK.zip"
#!/bin/bash -x

if [ "" = "$1" ]; then
  echo "Usage: "
  echo "  ./release-osx.sh version"
  exit 1
fi

cargo clean
cargo build --release
cargo build --release --target x86_64-apple-ios
gzip -c ../target/release/libpact_mock_server_ffi.dylib > ../target/release/libpact_mock_server_ffi-osx-x86_64-$1.dylib.gz
gzip -c ../target/release/libpact_mock_server_ffi.a > ../target/release/libpact_mock_server_ffi-osx-x86_64-$1.a.gz
cargo build --release --target x86_64-apple-ios
gzip -c ../target/x86_64-apple-ios/release/libpact_mock_server_ffi.a > ../target/x86_64-apple-ios/release/libpact_mock_server_ffi-ios-x86_64-$1.a.gz

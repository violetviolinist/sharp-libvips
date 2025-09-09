#!/usr/bin/env bash
set -e

node --version
npm --version
echo $VERSION_VIPS
echo $PLATFORM

tar -xzf libvips-${VERSION_VIPS}-${PLATFORM}-target.tar.gz -C /
du -sh /target
du -sh /target/*
du -sh /target/bin/*
export LD_LIBRARY_PATH=/target/lib
export PKG_CONFIG_PATH=$LD_LIBRARY_PATH/pkgconfig
export PATH=$PATH:/target/bin
pkg-config --modversion vips
pkg-config --modversion vips-cpp

cd libsharp/
pwd
rm -rf node_modules package-lock.json "v${VERSION_VIPS}"
ls -l

export SHARP_FORCE_GLOBAL_LIBVIPS=1
npm i --arch=x64 --platform=linux --build-from-source sharp --verbose

chmod 777 -R node_modules

ls -l node_modules/sharp/
du -sh node_modules

ldd node_modules/sharp/src/build/Release/sharp-$PLATFORM.node

echo "test begin."
node sharp_test.js
echo "test end."
node heif-test.js
echo "heif test end."
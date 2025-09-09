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


export OPENCV_DIR="/target"
export OPENCV_BIN_DIR="${OPENCV_DIR}/bin"
export OPENCV_LIB_DIR="${OPENCV_DIR}/lib64"
export OPENCV_INCLUDE_DIR="${OPENCV_DIR}/include"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/lib64/pkgconfig:${OPENCV_DIR}/lib/pkgconfig:${OPENCV_DIR}/lib64/pkgconfig"
export PATH="${OPENCV_DIR}/bin:/home/deploy/.cargo/bin:/usr/local/workx/tools/bin:$PATH"
export LIBRARY_PATH="${OPENCV_DIR}/lib:${OPENCV_DIR}/lib64:/usr/local/lib64:/usr/local/lib:/use/lib64:/usr/lib"
export LD_LIBRARY_PATH="${OPENCV_DIR}/lib:${OPENCV_DIR}/lib64:$LD_LIBRARY_PATH"
pkg-config --modversion vips
pkg-config --modversion vips-cpp

cd opencv
node --version
OPENCV4NODEJS_DISABLE_AUTOBUILD=1 npm i opencv4nodejs
chmod 777 -R node_modules

du -sh node_modules/opencv4nodejs
ldd node_modules/opencv4nodejs/build/Release/opencv4nodejs.node

node test-opencv.js
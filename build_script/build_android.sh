#!/bin/bash

BASE_PATH=$(cd `dirname $0`; pwd)

export PATH=$PATH:`pwd`/toolchain/bin

TARGET_HOST=aarch64-linux-android
export AR=$TARGET_HOST-ar
export AS=$TARGET_HOST-as
export CC=$TARGET_HOST-gcc
export CXX=$TARGET_HOST-g++
export LD=$TARGET_HOST-ld
export STRIP=$TARGET_HOST-strip

export CFLAGS="-fPIE -fPIC"
export LDFLAGS="-pie"

./configure --host=$TARGET_HOST \
--disable-shared \
--disable-frontend \
--enable-static \
--prefix=$BASE_PATH/out/

make clean
make install
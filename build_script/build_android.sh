#!/bin/bash

BASE_PATH=$(cd `dirname $0`; pwd)

export PATH=$PATH:`pwd`/toolchain/bin

TARGET_HOST=arm-linux-androideabi
export CC=$TARGET_HOST-gcc

export CFLAGS="-fPIE -fPIC -Os"
export LDFLAGS="-pie"

./configure \
--host=$TARGET_HOST \
--enable-static=no \
--disable-frontend \
--disable-decoder \
--prefix=$BASE_PATH/out/

make clean
make install

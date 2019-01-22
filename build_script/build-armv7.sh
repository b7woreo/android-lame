#!/bin/bash

CPU=armv7-a
NDK_ROOT=~/Library/AndroidNdk
PREBUILT=$NDK_ROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
PLATFORM=$NDK_ROOT/platforms/android-16/arch-arm
SYSROOT=$NDK_ROOT/sysroot

BASE_PATH=$(cd `dirname $0`; pwd)

export PATH=$PATH:$PREBUILT/bin

export LDFLAGS="-L$PLATFORM/usr/lib -L$PREBUILT/arm-linux-androideabi/lib -march=$CPU"
export CFLAGS="-I$SYSROOT/usr/include -I$SYSROOT/usr/include/arm-linux-androideabi -march=$CPU -mfloat-abi=softfp -mfpu=vfp -ffast-math -O2"

export CPPFLAGS="$CFLAGS"
export CFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="$LDFLAGS"

export AS=$PREBUILT/bin/arm-linux-androideabi-as
export LD=$PREBUILT/bin/arm-linux-androideabi-ld
export CXX="$PREBUILT/bin/arm-linux-androideabi-g++ --sysroot=${PLATFORM}"
export CC="$PREBUILT/bin/arm-linux-androideabi-gcc --sysroot=${PLATFORM}"
export NM=$PREBUILT/bin/arm-linux-androideabi-nm
export STRIP=$PREBUILT/bin/arm-linux-androideabi-strip
export RANLIB=$PREBUILT/bin/arm-linux-androideabi-ranlib
export AR=$PREBUILT/bin/arm-linux-androideabi-ar

./configure --host=arm-linux \
--disable-shared \
--disable-frontend \
--enable-static \
--prefix=$BASE_PATH/out/$CPU

make clean
make -j8
make install
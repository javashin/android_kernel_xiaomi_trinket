#!/bin/bash
clear

/usr/bin/cpupower frequency-set -g performance
/usr/sbin/x86_energy_perf_policy performance


umount /OUT
rm -rf /OUT
export ARCH=arm64
export SUBARCH=arm
mkdir /OUT
mount /OUT

export KBUILD_BUILD_VERSION=1
export KBUILD_BUILD_USER=javashin
export KBUILD_BUILD_HOST=darkmaza.org
export MAKE_ARGS=$@


export CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu-
export CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf-
export CC=/usr/bin/aarch64-unknown-linux-gnu-gcc
export LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd
export AR=/usr/bin/aarch64-unknown-linux-gnu-ar
export AS=/usr/bin/aarch64-unknown-linux-gnu-as
export NM=/usr/bin/aarch64-unknown-linux-gnu-nm
export RANLIB=/usr/bin/aarch64-unknown-linux-gnu-ranlib
export STRIP=/usr/bin/aarch64-unknown-linux-gnu-strip
export OBJCOPY=/usr/bin/aarch64-unknown-linux-gnu-objcopy
export OBJDUMP=/usr/bin/aarch64-unknown-linux-gnu-objdump
export HOSTCC=/usr/bin/aarch64-unknown-linux-gnu-gcc
export HOSTLD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd
export HOSTAR=/usr/bin/aarch64-unknown-linux-gnu-gcc-ar

export KCFLAGS+=" -O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14 "

export KBUILD_CFLAGS+=" -O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14 "

PATH="${PATH}" make -j4 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+=KCFLAGS+=" -O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14 " CROSS_COMPILE_ARM32=armv7-unknown-linux-gnueabihf- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y ginkgo-vikingo_defconfig


#PATH="${PATH}" make -j4 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+="-O3 -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -pipe" CROSS_COMPILE_ARM32=armv7-unknown-linux-gnueabihf- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y oldconfig

PATH="${PATH}" make -j4 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+=" -O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14 " CROSS_COMPILE_ARM32=armv7-unknown-linux-gnueabihf- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y prepare


PATH="${PATH}" make -j4 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+=" -O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a73.cortex-a53 -mtune=cortex-a73.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14 " CROSS_COMPILE_ARM32=armv7-unknown-linux-gnueabihf- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y V=0 Image.gz-dtb dtbo.img

cp /OUT/arch/arm64/boot/Image.gz-dtb /OUT/arch/arm64/boot/dtbo.img .


ls -lash /OUT/arch/arm64/boot/Image.gz-dtb
ls -lash ./Image.gz-dtb

ls -lash /OUT/arch/arm64/boot/dtbo.img
ls -lash  ./dtbo.img

echo "done"


echo "YAY"
echo "KERNAL KERNAL KERNAL KERNAL KARNAL KARMA KARMA KARMA"
echo "DONE By JavaShin-X 2020"




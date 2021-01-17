#!/bin/bash
clear

umount /OUT
rm -rf /OUT
export ARCH=arm64
export SUBARCH=arm
mkdir /OUT
mount /OUT

export KBUILD_BUILD_VERSION=1
export KBUILD_BUILD_USER=JavaShin-X
export KBUILD_BUILD_HOST=WrongDevice
export KBUILD_BUILD_TIMESTAMP="$(date -d "@$(git --no-pager show -s --format=%ct)")"


export CROSS_COMPILE="/usr/bin/aarch64-unknown-linux-gnu-"
export CROSS_COMPILE_ARM32="/usr/bin/armv7-unknown-linux-gnueabihf-"
export LD_LIBRARY_PATH="/cross-tc/clang/lib64:$LD_LIBRARY_PATH"


PATH="/cross-tc/clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/clang/bin/clang LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE=/usr/bin/aarch64-unknown-linux-gnu- CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y ginkgomoon_defconfig

PATH="/cross-tc/clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/clang/bin/clang LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE=/usr/bin/aarch64-unknown-linux-gnu- CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y oldconfig

PATH="/cross-tc/clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/clang/bin/clang LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE=/usr/bin/aarch64-unknown-linux-gnu- CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y prepare

#PATH="/cross-tc/clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/clang/bin/clang LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE=/usr/bin/aarch64-unknown-linux-gnu- CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y nconfig


export KCFLAGS+="-march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
export KBUILD_CFLAGS+="-march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
export KCFLAGS+="-O3 -mllvm -polly -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -Wno-error=misleading-indentation -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe "

#Gcc-10-Optimize
export KCFLAGS+="--param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14"

PATH="/cross-tc/clang/bin:${PATH}" make -j4 O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/clang/bin/clang LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE=/usr/bin/aarch64-unknown-linux-gnu- CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y KCFLAGS+="-O3 -mllvm -polly -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -Wno-error=misleading-indentation -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe " V=0 Image.gz-dtb dtbo.img


cp /OUT/arch/arm64/boot/Image.gz-dtb .

ls -lash /OUT/arch/arm64/boot/Image.gz-dtb
ls -lash ./Image.gz-dtb

cp /OUT/arch/arm64/boot/dtbo.img .
ls -lash /OUT/arch/arm64/boot/dtbo.img
ls -lash  ./dtbo.img



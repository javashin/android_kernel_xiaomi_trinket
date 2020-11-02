#!/bin/bash
clear 

/usr/bin/cpupower frequency-set -g performance
/usr/sbin/x86_energy_perf_policy performance
#echo "1" > /sys/devices/system/cpu/intel_pstate/no_turbo

umount /OUT
rm -rf /OUT
export ARCH=arm64
export SUBARCH=arm
mkdir /OUT
mount /OUT

export KBUILD_BUILD_VERSION=1
export KBUILD_BUILD_USER=javashin
export KBUILD_BUILD_HOST=darkmaza.org
export KBUILD_BUILD_TIMESTAMP="$(date -d "@$(git --no-pager show -s --format=%ct)")"


export CROSS_COMPILE="/usr/bin/aarch64-unknown-linux-gnu-"
export CROSS_COMPILE_ARM32="/usr/bin/armv7-unknown-linux-gnueabihf-"
export LD_LIBRARY_PATH="/cross-tc/clang/lib64:$LD_LIBRARY_PATH"
export CC="/cross-tc/proton-clang/bin/clang"
export HOSTCC="/cross-tc/proton-clang/bin/clang"
export HOSTCXX="/cross-tc/proton-clang/bin/clang++"
export HOSTLD="/cross-tc/proton-clang/bin/ld.lld"
export AR="/cross-tc/proton-clang/bin/llvm-ar"
export NM="/cross-tc/proton-clang/bin/llvm-nm"
export LD="/cross-tc/proton-clang/bin/ld.lld"
export AS="/cross-tc/proton-clang/bin/llvm-as"
export OBJCOPY="/cross-tc/proton-clang/bin/llvm-objcopy"
export OBJDUMP="/cross-tc/proton-clang/bin/llvm-objdump"

PATH="/cross-tc/proton-clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/proton-clang/bin/clang AR=/cross-tc/proton-clang/bin/llvm-ar NM=/cross-tc/proton-clang/bin/llvm-nm AS=/cross-tc/proton-clang/bin/llvm-as OBJCOPY=/cross-tc/proton-clang/bin/llvm-objcopy OBJDUMP=/cross-tc/proton-clang/bin/llvm-objdump LD=/cross-tc/proton-clang/bin/ld.lld CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE=/usr/bin/aarch64-unknown-linux-gnu- CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y ginkgo-vikingo_defconfig

#PATH="/cross-tc/proton-clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/proton-clang/bin/clang AR=/cross-tc/proton-clang/bin/llvm-ar NM=/cross-tc/proton-clang/bin/llvm-nm AS=/cross-tc/proton-clang/bin/llvm-as OBJCOPY=/cross-tc/proton-clang/bin/llvm-objcopy OBJDUMP=/cross-tc/proton-clang/bin/llvm-objdump LD=/cross-tc/proton-clang/bin/ld.lld CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE=/usr/bin/aarch64-unknown-linux-gnu- CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y oldconfig

PATH="/cross-tc/proton-clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/proton-clang/bin/clang AR=/cross-tc/proton-clang/bin/llvm-ar NM=/cross-tc/proton-clang/bin/llvm-nm AS=/cross-tc/proton-clang/bin/llvm-as OBJCOPY=/cross-tc/proton-clang/bin/llvm-objcopy OBJDUMP=/cross-tc/proton-clang/bin/llvm-objdump LD=/cross-tc/proton-clang/bin/ld.lld CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE=/usr/bin/aarch64-unknown-linux-gnu- CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y prepare

#PATH="/cross-tc/proton-clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/proton-clang/bin/clang AR=/cross-tc/proton-clang/bin/llvm-ar NM=/cross-tc/proton-clang/bin/llvm-nm AS=/cross-tc/proton-clang/bin/llvm-as OBJCOPY=/cross-tc/proton-clang/bin/llvm-objcopy OBJDUMP=/cross-tc/proton-clang/bin/llvm-objdump LD=/cross-tc/proton-clang/bin/ld.lld CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE=/usr/bin/aarch64-unknown-linux-gnu- CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y nconfig

export KCFLAGS+="-march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
export KBUILD_CFLAGS+="-march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
export KCFLAGS+="-O3 -mllvm -polly -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -Wno-error=misleading-indentation -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe "

#Gcc-10-Optimize
export KCFLAGS+="--param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14"

PATH="/cross-tc/proton-clang/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=/cross-tc/proton-clang/bin/clang AR=/cross-tc/proton-clang/bin/llvm-ar NM=/cross-tc/proton-clang/bin/llvm-nm AS=/cross-tc/proton-clang/bin/llvm-as OBJCOPY=/cross-tc/proton-clang/bin/llvm-objcopy OBJDUMP=/cross-tc/proton-clang/bin/llvm-objdump LD=/cross-tc/proton-clang/bin/ld.lld CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf- CLANG_TRIPLE=/usr/bin/aarch64-unknown-linux-gnu- CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu- SELINUX_DEFCONFIG=selinux_defconfig CONFIG_NO_ERROR_ON_MISMATCH=y KCFLAGS+="-O3 -mllvm -polly -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -Wno-error=misleading-indentation -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe " CONFIG_NO_ERROR_ON_MISMATCH=y V=0 Image.gz-dtb dtbo.img


cp /OUT/arch/arm64/boot/Image.gz-dtb .

ls -lash /OUT/arch/arm64/boot/Image.gz-dtb
ls -lash ./Image.gz-dtb

#python2 libufdt/src/mkdtboimg.py create /OUT/arch/arm64/boot/dtbo.img /OUT/arch/arm64/boot/dts/qcom/*.dtbo
cp /OUT/arch/arm64/boot/dtbo.img .
ls -lash /OUT/arch/arm64/boot/dtbo.img
ls -lash  ./dtbo.img

cp ./dtbo.img ANYKERNEL/
cp ./Image.gz-dtb ANYKERNEL/



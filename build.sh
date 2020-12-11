clear
umount /OUT
rm -rf /OUT
export ARCH=arm64
export SUBARCH=arm
mkdir /OUT
mount /OUT
export PATH="/cross-tc/silont-clang/bin:$PATH"
export KBUILD_BUILD_VERSION=1
export KBUILD_BUILD_USER=javashin
export KBUILD_BUILD_HOST=moonbase
export CROSS_COMPILE="/usr/bin/aarch64-unknown-linux-gnu-"
export CROSS_COMPILE_ARM32="/usr/bin/armv7-unknown-linux-gnueabihf-"
export LD_LIBRARY_PATH="/cross-tc/silont-clang/lib64:$LD_LIBRARY_PATH"
export CC="/cross-tc/silont-clang/bin/clang"
export CXX="/cross-tc/silont-clang/bin/clang/clang++"
export HOSTCC="/cross-tc/silont-clang/bin/clang"
export HOSTCXX="/cross-tc/silont-clang/bin/clang++"
export HOSTLD="/cross-tc/silont-clang/bin/ld.lld"
export HOSTAR="/cross-tc/silont-clang/bin/llvm-ar"
export AR="/cross-tc/silont-clang/bin/llvm-ar"
export NM="/cross-tc/silont-clang/bin/llvm-nm"
export LD="/cross-tc/silont-clang/bin/ld.lld"
export AS="/cross-tc/silont-clang/bin/llvm-as"
export OBJCOPY="/cross-tc/silont-clang/bin/llvm-objcopy"
export OBJDUMP="/cross-tc/silont-clang/bin/llvm-objdump"
export RANLIB="/cross-tc/silont-clang/bin/llvm-ranlib"
export STRIP="/cross-tc/silont-clang/bin/llvm-strip"

# Gcc-11-Optimize - Clang Optimize Hacks.
export KCFLAGS+=" -O3 -mllvm -polly -march=armv8-a -mcpu=cortex-a53 -mtune=cortex-a53 --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14 -Wno-error=misleading-indentation -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe"

#Clang Optimize Hacks. DONE
#export KCFLAGS+=" -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
#export KBUILD_CFLAGS+=" -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo"
#export KCFLAGS+=" -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo "
#Clang Optimize Hacks.
#export KCFLAGS+=" #-Wno-error=misleading-indentation -Wno-error=incompatible-pointer-types-discards-qualifiers -Wno-enum-conversion -pipe"

make O=/OUT ARCH=arm64 vendor/moonbase_defconfig
make -j$(nproc --all) O=/OUT ARCH=arm64 \
CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm \
OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump \
STRIP=llvm-strip CLANG_TRIPLE=aarch64-unknown-linux-gnu- \
CROSS_COMPILE=aarch64-unknown-linux-gnu- CLANG_TRIPLE_ARM32=armv7-unknown-linux-gnueabihf- \
CROSS_COMPILE_ARM32=armv7-unknown-linux-gnueabihf- oldconfig prepare nconfig Image.gz-dtb dtbo.img V=0

mkimage -A arm -O linux -T kernel -C none -a 0x40008000 -e 40008040 -n linux-4.4 -d /home/lxs/FriendlyArm-Tiny4412-SDK/linux-4.4.38/arch/arm/boot/zImage uImage

make dtbs
cp ./arch/arm/boot/dts/exynos4412-tiny4412.dtb  ./

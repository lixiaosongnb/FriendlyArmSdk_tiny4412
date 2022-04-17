# This bash aim to easy make uImage and dtb copy to this directory flash
#!/bin/bash

LINUX_KERNEL_VERSION=linux-4.4

ARCH=arm
OS=linux
KERNEL_LOAD_ARRT=40008000
KERNEL_START_ADDR=40008040

ZIMAGE_PWD=$PWD/arch/arm/boot

DTB_PWD=$PWD/arch/arm/boot/dts
DTB_FILE_NAME=exynos4412-tiny4412.dtb

UIMAGE_STORD_PWD=$pwd

echo "Degin make uImage and dtb..."

mkimage -A $ARCH -O $OS -T kernel -C none -a $KERNEL_LOAD_ARRT -e $KERNEL_START_ADDR -n $LINUX_KERNEL_VERSION -d $ZIMAGE_PWD/zImage uImage

if [ $? -ne 0 ];then
	echo "mkimage failed..exit"
	exit
fi

make dtbs

if [ $? -ne 0 ];then
	echo "make dtb failed..exit"
	exit
fi

cp $DTB_PWD/$DTB_FILE_NAME ./

echo "Done"

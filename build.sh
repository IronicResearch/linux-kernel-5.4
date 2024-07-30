#!/bin/sh
export ARCH=x86_64
export CPUS=`nproc`
export JOBS="-j$((CPUS))"

if [ ! -f .config ]
then
	make x86_64_defconfig
fi
make $JOBS
make modules
make modules_install
sudo make install

#!/bin/sh

set -xe

. ./config.sh

$NAME = "temple-img.iso"
if [ $# -lt 1 ]; then
    echo "Using $1"
    $NAME=$1
fi


sync
sudo umount $QEMU_IMG_MOUNT_DIR || true
mkdir -p $QEMU_IMG_MOUNT_DIR
sudo mount -o loop,offset=$QEMU_IMG_MOUNT_OFFSET,rw,uid=`id -u`,gid=`id -g` "$NAME" $QEMU_IMG_MOUNT_DIR

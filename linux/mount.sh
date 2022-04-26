#!/bin/sh

set -xe

. ./config.sh

sync
sudo umount $QEMU_IMG_MOUNT_DIR || true
mkdir -p $QEMU_IMG_MOUNT_DIR
sudo mount -o loop,offset=$QEMU_IMG_MOUNT_OFFSET,rw,uid=`id -u`,gid=`id -g` "$QEMU_IMG_NAME" $QEMU_IMG_MOUNT_DIR

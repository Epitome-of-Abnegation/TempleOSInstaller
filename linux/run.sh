#!/bin/sh

set -xe

. ./config.sh

if [ $# -eq 1 ]; then
    echo "Using $1"
    $QEMU_IMG_NAME="$1"
fi

sync
sudo umount $QEMU_IMG_MOUNT_DIR || true
$QEMU_SYSTEM_X86_64 $QEMU_FLAGS "$QEMU_IMG_NAME"

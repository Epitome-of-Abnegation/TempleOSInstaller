#!/bin/sh

set -xe

. ./config.sh

sync
sudo umount $QEMU_IMG_MOUNT_DIR || true
$QEMU_SYSTEM_X86_64 $QEMU_FLAGS "$QEMU_IMG_NAME"

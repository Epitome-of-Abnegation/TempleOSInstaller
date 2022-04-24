#!/bin/sh

set -xe

. ./config.sh

$QEMU_IMG create $QEMU_IMG_NAME $QEMU_IMG_SIZE
$QEMU_SYSTEM_X86_64 $QEMU_FLAGS -cdrom $TEMPLEOS_ISO -hda $QEMU_IMG_NAME -boot d

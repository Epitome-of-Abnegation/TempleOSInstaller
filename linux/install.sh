#!/bin/sh
echo "Checking for QEMU..."
if ! type "qemu-io" > /dev/null; then # Checking that QEMU exists

  # Package Manager specific; better to define manually than actually building from source (too long).
  declare -A osInfo;
  osInfo[/etc/redhat-release]="yum install"
  osInfo[/etc/arch-release]="pacman -S"
  osInfo[/etc/gentoo-release]="emerge"
  osInfo[/etc/SuSE-release]="zypper install"
  osInfo[/etc/debian_version]="apt install -y"
  osInfo[/etc/alpine-release]="apk add"

  for f in ${!osInfo[@]}
  do
      if [[ -f $f ]];then
          sudo ${osInfo[$f]} qemu
      fi
  done
fi
echo "Qemu has been installed."
echo
set -xe

. ./config.sh


$QEMU_IMG create $QEMU_IMG_NAME $QEMU_IMG_SIZE
$QEMU_SYSTEM_X86_64 $QEMU_FLAGS -cdrom $TEMPLEOS_ISO -hda $QEMU_IMG_NAME -boot d &

echo "Installed!"

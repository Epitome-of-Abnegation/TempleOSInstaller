Invoke-WebRequest -Uri https://qemu.weilnetz.de/w64/2022/qemu-w64-setup-20220419.exe -OutFile qemu-w64-setup-20220419.exe
./qemu-w64-setup-20220419.exe
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

$QEMU_IMG=
$QEMU_SYSTEM_X86_64=
$QEMU_FLAGS="-display gtk,zoom-to-fit=on -enable-kvm -m 2048"
$QEMU_IMG_SIZE="512M"
$QEMU_IMG_MOUNT_DIR="./mnt/"
# Note on the offset: https://www.cloudsavvyit.com/7517/how-to-mount-a-qemu-virtual-disk-image/
$QEMU_IMG_MOUNT_OFFSET=32256
$TEMPLEOS_ISO="./TempleOS.ISO"

$QEMU_IMG create "$1" $QEMU_IMG_SIZE
$QEMU_SYSTEM_X86_64 $QEMU_FLAGS -cdrom $TEMPLEOS_ISO -hda "$1" -boot d


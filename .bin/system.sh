#! /bin/bash

# Enable zram
if ! (grep 'systemd.zram' /etc/default/grub); then
    sed -i '/GRUB_CMDLINE_LINUX_DEFAULT=/ s/.$/ systemd.zram=1"/;s/" /"/' /etc/default/grub
fi

if ! (grep 'GRUB_DISABLE_OS_PROBER' /etc/default/grub); then
    echo 'GRUB_DISABLE_OS_PROBER=false' | tee -a /etc/default/grub
fi

tee /etc/xdg/reflector/reflector.conf <<EOF
--save /etc/pacman.d/mirrorlist
--country France
--protocol https
--sort rate
--age 12
EOF

sed -i 's/^#Color$/Color/' /etc/pacman.conf
sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
sed -i 's/^#CheckSpace$/CheckSpace/' /etc/pacman.conf
sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' /etc/pacman.conf
sed -i '/^VerbosePkgLists$/ a ILoveCandy' /etc/pacman.conf
sed -i '/\[multilib]$/ {
    N
    /Include/s/#//g}' /etc/pacman.conf

pacman -Sy
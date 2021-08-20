#! /bin/bash

# Enable zram
sed -i '/GRUB_CMDLINE_LINUX_DEFAULT=/ s/.$/ systemd.zram=1"/;s/" /"/' /etc/default/grub

echo 'GRUB_DISABLE_OS_PROBER=false' | tee -a /etc/default/grub

tee /etc/xdg/reflector/reflector.conf <<EOF
--save /etc/pacman.d/mirrorlist
--country France
--protocol https
--sort rate
--age 12
EOF

sed -i 's/^#Color$/Color/' /mnt/etc/pacman.conf
sed -i 's/^#ParallelDownloads/ParallelDownloads/' /mnt/etc/pacman.conf
sed -i 's/^#CheckSpace$/CheckSpace/' /mnt/etc/pacman.conf
sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' /mnt/etc/pacman.conf
sed -i '/^VerbosePkgLists$/ a ILoveCandy' /mnt/etc/pacman.conf
sed -i '/\[multilib]$/ {
    N
    /Include/s/#//g}' /mnt/etc/pacman.conf
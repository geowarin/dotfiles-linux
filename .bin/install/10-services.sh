#!/usr/bin/env -S bash -e

sudo sed -i 's/^#Color$/Color/' /etc/pacman.conf
sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
sudo sed -i 's/^#CheckSpace$/CheckSpace/' /etc/pacman.conf
sudo sed -i 's/^#VerbosePkgLists$/VerbosePkgLists/' /etc/pacman.conf
sudo sed -i '/^VerbosePkgLists$/ a ILoveCandy' /etc/pacman.conf
sudo sed -i '/\[multilib]$/ {
    N
    /Include/s/#//g}' /etc/pacman.conf

sudo pacman -Sy

paru -S \
pacman-contrib \
reflector \
brother-mfc-j4625dw \
cups \
os-prober

sudo tee /etc/xdg/reflector/reflector.conf <<EOF
--save /etc/pacman.d/mirrorlist
--country France
--protocol https
--sort rate
--age 12
EOF

# sudo systemctl enable lightdm
sudo systemctl enable reflector.timer
# sudo systemctl enable fstrim.timer
sudo systemctl enable paccache.timer
sudo systemctl enable cups.socket

# if ! (grep 'GRUB_DISABLE_OS_PROBER' /etc/default/grub); then
#     sudo echo 'GRUB_DISABLE_OS_PROBER=false' | tee -a /etc/default/grub
# fi

# sudo grub-mkconfig -o /boot/grub/grub.cfg

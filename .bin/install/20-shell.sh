#!/usr/bin/env -S bash -e

# fonts
paru -S \
noto-fonts \
ttf-joypixels \
nerd-fonts-jetbrains-mono
# noto-fonts-emoji

# Terminal
paru -S \
man-db \
xdg-utils \
kitty \
zsh \
fzf \
starship \
zplug \
lsd \
bat \
hub \
fd \
grep \
ripgrep \
which \
btop \
pkgfile

# useful programs
paru -S \
xdg-user-dirs \
f3d-bin \
bitw-git \
imv \
evince \
visual-studio-code-bin \
flameshot \
seahorse

paru -S \
polkit-gnome \
gnome-keyring \
dunst \
thunar \
tumbler \
tumbler-extra-thumbnailers \
gvfs \
blueman \
pavucontrol \
betterlockscreen \
nitrogen \
picom \
rofi \
bitwarden-cli \
# bitwarden-rofi
rofimoji \
clipmenu \
touchegg \
catfish \
plocate

# i3 specific
paru -S \
autotiling \
i3status-rust \
python-i3ipc \
i3icons2-git

# qtile
# paru -S \
# qtile \
# python-dbus-next

# nautilus \
#bugfix for shushi
# webkit2gtk \
# sushi \

chsh -s /usr/bin/zsh 

systemctl --user enable --now clipmenud.service

pkgfile --update

sudo mkdir /etc/pacman.d/hooks

sudo tee /etc/pacman.d/hooks/i3status.hook <<EOF
[Trigger]
Operation = Upgrade
Type = Package
Target = *

[Action]
When = PostTransaction
Exec = /usr/bin/pkill -SIGUSR1 i3status-rs
EOF

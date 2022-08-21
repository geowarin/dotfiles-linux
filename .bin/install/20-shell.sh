#!/usr/bin/env -S bash -e

# Terminal
paru -S \
man-db \
xdg-utils \
kitty \
zsh \
fzf \
starship \
zplug \
visual-studio-code-bin \
nerd-fonts-jetbrains-mono \
exa \
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
flameshot

# i3 utils
# thunar \

paru -S \
polkit-gnome \
gnome-keyring \
dunst \
nautilus \
sushi \
tumbler \
tumbler-extra-thumbnailers \
gvfs \
autotiling \
python-i3ipc \
i3icons2-git \
blueman \
pavucontrol \
betterlockscreen \
i3status-rust \
noto-fonts \
nitrogen \
picom \
rofi \
bitwarden-cli-bin \
bitwarden-rofi \
rofi-greenclip \
rofimoji \
clipmenu \
touchegg


chsh -s /usr/bin/zsh 

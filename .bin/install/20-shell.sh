#!/usr/bin/env -S bash -e

# fonts
paru -S \
noto-fonts \
ttf-joypixels \
nerd-fonts-jetbrains-mono \
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
visual-studio-code-bin \
flameshot

# i3 utils
# thunar \

paru -S \
polkit-gnome \
gnome-keyring \
dunst \
thunar \
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
nitrogen \
picom \
rofi \
bitwarden-cli \
bitwarden-rofi \
rofi-greenclip \
rofimoji \
clipmenu \
touchegg

# nautilus \
#bugfix for shushi
# webkit2gtk \
# sushi \

chsh -s /usr/bin/zsh 

#!/usr/bin/env -S bash -e

set -e

paru -S \
archlinux-wallpaper \
arc-gtk-theme \
papirus-icon-theme

# sed -i 's|^#GRUB_THEME.*|GRUB_THEME="/usr/share/grub/themes/poly-dark/theme.txt"|' /etc/default/grub

tee /etc/lightdm/lightdm-gtk-greeter.conf <<EOF
[greeter]
theme-name = Arc-Dark
icon-theme-name = Papirus
background = /usr/share/backgrounds/archlinux/archbtw.png
EOF

mkdir -p "$HOME/.config/nitrogen"

tee "$HOME/.config/nitrogen/nitrogen.cfg" <<EOF
[nitrogen]
view=icon
recurse=true
sort=alpha
icon_caps=false
dirs=/usr/share/backgrounds;$HOME/wallpapers/;
EOF

tee "$HOME/.config/nitrogen/bg-saved.cfg" <<EOF
[xin_-1]
file=$HOME/wallpapers/wallhaven-136m9w.png
mode=5
bgcolor=#000000
EOF

tee "$HOME/.gtkrc-2.0" <<EOF
gtk-theme-name="Arc-Dark"
gtk-icon-theme-name="Papirus"
gtk-font-name="Cantarell 11"
gtk-cursor-theme-name="Adwaita"
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=0
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintfull"
gtk-xft-rgba="rgb"
EOF

tee "$HOME/.config/gtk-3.0/settings.ini" <<EOF
[Settings]
gtk-theme-name=Arc-Dark
gtk-icon-theme-name=Papirus
gtk-font-name=Cantarell 11
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=0
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull
gtk-xft-rgba=rgb
EOF
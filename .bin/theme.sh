#! /bin/bash

sed -i 's|^#GRUB_THEME.*|GRUB_THEME="/usr/share/grub/themes/poly-dark/theme.txt"|' /etc/default/grub

tee /etc/lightdm/lightdm-gtk-greeter.conf <<EOF
[greeter]
theme-name = Arc-Dark
icon-theme-name = Arc
background = $HOME/wallpapers/wallhaven-136m9w.png
EOF

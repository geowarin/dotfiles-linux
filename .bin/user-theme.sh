#! /bin/bash

home_dir=$1
if [ ! -d "$home_dir" ]; then 
    echo "Please pass a home dir as the first argument to $0"
    exit 1
fi

mkdir -p "$home_dir/.config/nitrogen"

tee "$home_dir/.config/nitrogen/nitrogen.cfg" <<EOF
[nitrogen]
view=icon
recurse=true
sort=alpha
icon_caps=false
dirs=/usr/share/backgrounds;$home_dir/wallpapers/;
EOF

tee "$home_dir/.config/nitrogen/bg-saved.cfg" <<EOF
[xin_-1]
file=$home_dir/wallpapers/wallhaven-136m9w.png
mode=5
bgcolor=#000000
EOF

tee "$home_dir/.gtkrc-2.0" <<EOF
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

tee "$home_dir/.config/gtk-3.0/settings.ini" <<EOF
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
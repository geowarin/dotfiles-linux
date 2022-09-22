#!/usr/bin/env -S bash -e

paru -S \
xdg-desktop-portal-gtk \
signal-desktop \
flatpak \
firefox \
arandr \
mpv
# freetube-bin

flatpak install \
com.github.tchx84.Flatseal \
io.webtorrent.WebTorrent \
com.spotify.Client \
com.leinardi.gwe \
org.gtk.Gtk3theme.Adwaita-dark
# com.usebottles.bottles \
# io.github.achetagames.epic_asset_manager
# com.discordapp.Discord

sudo flatpak override --env=GTK_THEME=Adwaita-dark

sudo tee /etc/X11/xorg.conf.d/99-synaptics-overrides.conf <<EOF
Section  "InputClass"
    Identifier  "touchpad overrides"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "AccelSpeed" "0.5"
EndSection
EOF

sudo tee /etc/X11/xorg.conf.d/10-keyboard.conf <<EOF
 Section "InputClass"
    Identifier "MyKeyboard" 
    Driver "libinput" 
    Option "XkbLayout" "fr,us" 
    Option "XkbOptions" "terminate:ctrl_alt_bksp,grp:menu_toggle" 
    MatchIsKeyboard "on"
EndSection
EOF
#!/usr/bin/env bash

~/.screenlayout/home.sh &
gnome-keyring-daemon --start &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# exec --no-startup-id greenclip daemon

~/.config/picom/start.sh &
nitrogen --restore &
#exec --no-startup-id touchegg
# exec_always --no-startup-id ~/.config/polybar/start.sh

# NetworkManager
# exec --no-startup-id nm-applet
#!/usr/bin/env bash

# xdotool mousemove 1320 770
rofi -no-lazy-grab -show window -theme windows -window-command "xkill -id {window}" -pid ~/.cache/rofi-windows.pid -replace
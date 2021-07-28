#!/usr/bin/env bash

rofi_command="rofi -theme power"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

uptime=$(uptime -p | sed -e 's/up //g')

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    "$shutdown")
		  systemctl poweroff
      ;;
    "$reboot")
		  systemctl reboot
      ;;
    "$lock")
		  betterlockscreen -l blur
      ;;
    "$suspend")
      # mpc -q pause
      # amixer set Master mute
      systemctl suspend
      ;;
    "$logout")
      i3-msg exit
      ;;
esac
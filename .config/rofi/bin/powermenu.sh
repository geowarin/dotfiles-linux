#!/usr/bin/env bash

# Themes:
# column_circle     column_square     column_rounded     column_alt
# card_circle     card_square     card_rounded     card_alt
# dock_circle     dock_square     dock_rounded     dock_alt
# drop_circle     drop_square     drop_rounded     drop_alt
# full_circle     full_square     full_rounded     full_alt
# row_circle      row_square      row_rounded      row_alt

# Colors:
# berry.rasi bluish.rasi cocoa.rasi  faded.rasi
# gotham.rasi mask.rasi nightly.rasi nordic.rasi

# /home/geo/.config/rofi/powermenu.sh row_alt.rasi nordic.rasi
# /home/geo/.config/rofi/powermenu.sh card_circle.rasi nordic.rasi


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
      mpc -q pause
      amixer set Master mute
      systemctl suspend
      ;;
    "$logout")
      i3-msg exit
      ;;
esac
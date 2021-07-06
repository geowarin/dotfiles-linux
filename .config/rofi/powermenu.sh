#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# column_circle     column_square     column_rounded     column_alt
# card_circle     card_square     card_rounded     card_alt
# dock_circle     dock_square     dock_rounded     dock_alt
# drop_circle     drop_square     drop_rounded     drop_alt
# full_circle     full_square     full_rounded     full_alt
# row_circle      row_square      row_rounded      row_alt

theme="full_circle"
# dir="$HOME/.config/rofi/powermenu"
dir="/usr/share/rofi/1080p/powermenu"


# themeIndex=${1:-"$RANDOM % 24"}
# colorIndex=${2:-"$RANDOM % 8"}

# # random colors
# styles=($(ls -p --hide="colors.rasi" $dir/styles))
# color="${styles[$colorIndex]}"

# # comment these lines to disable random style
# themes=($(ls -p --hide="powermenu.sh" --hide="styles" --hide="confirm.rasi" --hide="message.rasi" $dir))
# theme="${themes[$themeIndex]}"


theme="${1:-row_alt.rasi}"
color="${2:-nordic.rasi}"
# echo "$theme $color"

uptime=$(uptime -p | sed -e 's/up //g')

# comment this line to disable random colors
sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

rofi_command="rofi -theme $dir/$theme"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""


# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    "$shutdown")
		systemctl poweroff
        ;;
    "$reboot")
		systemctl reboot
        ;;
    "$lock")
		if [[ -f /usr/bin/i3lock ]]; then
			i3lock
		elif [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l
		fi
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

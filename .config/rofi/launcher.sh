#!/usr/bin/env bash

mode="${1:-colorful}"
theme="${2:-style_1.rasi}"
color="${3:-#42A5F5ff}"

# dir="$HOME/.config/rofi/launchers/colorful"
dir="/home/geo/dev/rofi-themes/launchers/$mode/"

# dark
ALPHA="#00000000"

BG="${4:-#000000ff}"
FG="#FFFFFFff"
SELECT="#101010ff"

# accent colors
# COLORS=('#EC7875' '#61C766' '#FDD835' '#42A5F5' '#BA68C8' '#4DD0E1' '#00B19F' \
# 		'#FBC02D' '#E57C46' '#AC8476' '#6D8895' '#EC407A' '#B9C244' '#6C77BB')

case $mode in
	'colorful')
		cat > "$dir/colors.rasi" <<- EOF
			/* colors */

			* {
			al:  $ALPHA;
			bg:  $BG;
			se:  $SELECT;
			fg:  $FG;
			ac:  $color;
			}
		EOF
		rofi -no-lazy-grab -show drun -modi drun -theme "$dir/$theme"
	;;	
	'misc' )
		rofi -no-lazy-grab -show drun -modi drun -theme "$dir/$theme"
	;;	
	'ribbon' | 'slate')
		sed -i -e "s/@import .*/@import \"$color\"/g" "$dir/styles/colors.rasi"
		rofi -no-lazy-grab -show drun -modi drun -theme "$dir/$theme"
	;;	
	'text')
		sed -i -e "s/@import .*/@import \"$color\"/g" "$dir/styles/colors.rasi"
		rofi -no-lazy-grab -show drun -modi run,drun,window -theme "$dir/$theme"
	;;
esac


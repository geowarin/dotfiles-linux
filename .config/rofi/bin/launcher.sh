#!/usr/bin/env bash

# --- TEXT
# theme: style_{1-7}
# color: berry.rasi black.rasi bluish.rasi cocoa.rasi colors.rasi faded.rasi gotham.rasi mask.rasi nightly.rasi nordic.rasi white.rasi
# /home/geo/.config/rofi/launcher.sh text style_7.rasi nordic.rasi


# --- COLORFUL
# colorful style_{1-12} hexcolor
# /home/geo/.config/rofi/launcher.sh colorful style_1.rasi "#EC407AFF" "#37474fF0"


# --- MISC
# blurry    blurry_full     kde_simplemenu      kde_krunner     launchpad
# gnome_do  slingshot       appdrawer           appdrawer_alt   appfolder
# column    row             row_center          screen          row_dock        row_dropdown

# /home/geo/.config/rofi/launcher.sh misc kde_simplemenu.rasi
rofi -no-lazy-grab -show drun -modi drun -theme launcher

# --- SLATE
# slate_full     slate_center     slate_left
# slate_right    slate_top        slate_bottom
#
# Colors:
# Amber.rasi Black.rasi Blue.rasi Blue_gray.rasi Brown.rasi Cyan.rasi Deep_orange.rasi
# Deep_purple.rasi Gray.rasi Green.rasi Indigo.rasi Light_blue.rasi Light_green.rasi
# Lime.rasi Orange.rasi Pink.rasi Purple.rasi Red.rasi Teal.rasi Yellow.rasi
# /home/geo/.config/rofi/launcher.sh slate slate_center.rasi Black.rasi

# --- RIBBON
# ribbon_top        ribbon_top_round        ribbon_bottom       ribbon_bottom_round
# ribbon_left       ribbon_left_round       ribbon_right        ribbon_right_round
# full_bottom       full_top                full_left           full_right
#
# berry.rasi bluish.rasi cocoa.rasi colors.rasi faded.rasi gotham.rasi
# mask.rasi nightly.rasi nordic.rasi
# /home/geo/.config/rofi/launcher.sh ribbon ribbon_bottom.rasi gotham.rasi


# rofi -no-lazy-grab -show drun -modi drun -theme /home/geo/.config/rofi/kde.rasi
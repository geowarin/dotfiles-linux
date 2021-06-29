#!/bin/bash

killall -q polybar

polybar primary 2> "$HOME/.cache/poly-main.log" & disown
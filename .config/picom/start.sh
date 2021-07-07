#!/usr/bin/env bash

echo "toto" > ~/.cache/picom.log

virt=$(systemd-detect-virt)
if [[ -n $virt ]]; then
    picom --config ~/.config/picom/picom-virt.conf
else
    picom --experimental-backends
fi
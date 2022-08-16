#! /bin/bash

# pacman -S extra/bluez extra/bluez-utils

tee /etc/bluetooth/main.conf << EOF
[Policy]
AutoEnable=true

[General]
DiscoverableTimeout = 0
EOF

# My headset
# 04:52:C7:7E:46:4C

# 
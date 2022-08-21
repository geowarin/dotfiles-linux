#!/usr/bin/env -S bash -e

sudo pacman -S --needed base-devel

pushd /tmp
git clone https://aur.archlinux.org/paru-bin.git
pushd paru-bin
makepkg -si
popd
popd

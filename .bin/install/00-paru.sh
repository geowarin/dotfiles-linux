#!/usr/bin/env -S bash -e

sudo pacman -S --needed base-devel

pushd /tmp
git clone https://aur.archlinux.org/paru.git
pushd paru
makepkg -si
popd
popd
#!/usr/bin/env bash

cd $(mktemp -d)
sudo pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin
makepkg -si --noconfirm
cd -

rm -rf yay-bin
cd -

#!/usr/bin/env bash

sudo pacman -S --noconfirm yay

while read line; do
    if [[ "$line" =~ ^# ]] || [ "$line" == "" ];then continue; fi
    yay -S --noconfirm ${line#- }
done < ./manjaro-i3wm.md

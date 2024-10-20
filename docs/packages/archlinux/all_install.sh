#!/usr/bin/env bash

while read line; do
    if [[ "$line" =~ ^# ]] || [ "$line" == "" ];then continue; fi
    yay -S --noconfirm ${line#- }
done < ./archlinux-i3wm.md

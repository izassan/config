#!/usr/bin/env bash

set -e

sudo pacman -S --needed --noconfirm \
    xdg-user-dirs-gtk \
    fcitx5-im fcitx5-mozc fcitx5-configtool manjaro-asian-input-support-fcitx5 \
    noto-fonts-cjk noto-cjk-fontconfig

sudo localectl set-keymap jp106
LANG=C xdg-user-dirs-gtk-update
LANG=C xdg-user-dirs-update --force

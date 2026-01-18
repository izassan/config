#!/usr/bin/env bash

set -e

sudo pacman -Syu
sudo pacman -S --needed --noconfirm yay fakeroot git

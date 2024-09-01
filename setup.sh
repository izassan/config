#!/usr/bin/env bash

mkdir -p ~/.config
mkdir -p ~/local_config

ln -sfnv $PWD/git $HOME/.config/git
ln -sfnv $PWD/vim $HOME/.vim
ln -sfnv $PWD/tmux.conf $HOME/.tmux.conf

ln -sfnv $PWD/zsh $HOME/.zsh
ln -sfnv $PWD/zsh/zshrc $HOME/.zshrc
ln -sfnv $PWD/zsh/zshenv $HOME/.zshenv

mkdir -p $HOME/.config
ln -sfnv $PWD/picom.conf $HOME/.config/picom.conf
ln -sfnv $PWD/i3 $HOME/.config/i3
ln -sfnv $PWD/rofi $HOME/.config/rofi
ln -sfnv $PWD/conky $HOME/.config/conky
ln -sfnv $PWD/polybar $HOME/.config/polybar
ln -sfnv $PWD/terminator $HOME/.config/terminator

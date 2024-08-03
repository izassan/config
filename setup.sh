#!/usr/bin/env bash

mkdir -p ~/.config
mkdir -p ~/local_config

ln -sfnv $PWD/git $HOME/.config/git
ln -sfnv $PWD/tmux.conf $HOME/.tmux.conf

ln -sfnv $PWD/zsh $HOME/.zsh
ln -sfnv $PWD/zsh/zshrc $HOME/.zshrc
ln -sfnv $PWD/zsh/zshenv $HOME/.zshenv

#!/usr/bin/env bash

XDG_CONFIG_HOME=$HOME/.config

mkdir -p $XDG_CONFIG_HOME

ln -sfnv $PWD/git $XDG_CONFIG_HOME/git
ln -sfnv $PWD/vim $XDG_CONFIG_HOME/vim
ln -sfnv $PWD/zsh $XDG_CONFIG_HOME/zsh

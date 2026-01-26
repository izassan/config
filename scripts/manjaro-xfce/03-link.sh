#!/usr/bin/env bash

XDG_CONFIG_HOME=$HOME/.config

mkdir -p $XDG_CONFIG_HOME

ln -sfnv $(realpath $PWD/../../git) $XDG_CONFIG_HOME/git
ln -sfnv $(realpath $PWD/../../vim) $XDG_CONFIG_HOME/vim
ln -sfnv $(realpath $PWD/../../zsh) $XDG_CONFIG_HOME/zsh
ln -sfnv $(realpath $PWD/../../zsh/.zshenv) $HOME/.zshenv
ln -sfnv $(realpath $PWD/../../maskcmd) $XDG_CONFIG_HOME/maskcmd
ln -sfnv $(realpath $PWD/../../starship/starship.toml) $XDG_CONFIG_HOME/starship.toml

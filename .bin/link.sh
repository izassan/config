#!/usr/bin/env bash

for i in *; do
    if [ $i = "README.md" ];then continue; fi
    if [ $i = "Makefile" ];then continue; fi
    if [ $i = "dotconfig" ];then continue; fi

    ln -sfv $PWD/$i $HOME/.$i
done

for i in dotconfig/*; do
    f=${i##dotconfig/}

    ln -sfv $PWD/$i $HOME/.config/$f
done


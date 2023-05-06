#!/usr/bin/env bash

make_symbolic(){
    src=$1
    dest=$2
    if [ -d $dest ] && [ -L $dest ];then
        rm -f $dest
    fi
    ln -sfv $src $dest
}

for i in *; do
    if [ $i = "README.md" ];then continue; fi
    if [ $i = "Makefile" ];then continue; fi
    if [ $i = "dotconfig" ];then continue; fi

    make_symbolic $PWD/$i $HOME/.$i
done

for i in dotconfig/*; do
    f=${i##dotconfig/}

    make_symbolic $PWD/$i $HOME/.config/$f
done


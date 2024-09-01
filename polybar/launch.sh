#!/usr/bin/env bash

polybar-msg cmd quit

polybar main 2>&1 | tee -a /tmp/polybar_main.log & disown

echo "Bars launched"

#!/usr/bin/env bash

while read line; do
    if [[ "$line" =~ ^# ]] || [ "$line" == "" ];then continue; fi
    go install ${line#- }
done < ./go.md

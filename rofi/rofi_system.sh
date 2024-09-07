#!/usr/bin/env bash

set -euCo pipefail

function main() {
    local -Ar menu=(
        ['Lock']='dm-tool lock'
        ['Logout']='i3-msg exit'
        ['Poweroff']='systemctl poweroff'
        ['Reboot']='systemctl reboot'
    )

    local -r IFS=$'\n'
    local -r yes='yes' no='no'
    if [[ $# -eq 0 ]];then
        echo "${!menu[*]}"
    elif [[ $# -eq 1 ]];then
        echo $1 ${yes} 
        echo $1 ${no} 
    else
        if [[ $2 == ${yes} ]];then
            eval "${menu[$1]}"
        else
            echo "${!menu[*]}"
        fi
    fi
}

main $@

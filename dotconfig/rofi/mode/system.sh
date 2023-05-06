set -euCo pipefail

function main() {
    local -Ar menu=(
        ['shutdown']='systemctl poweroff'
        ['reboot']='systemctl reboot'
        ['logout']='i3-msg exit'
    )

    local -r IFS=$'\n'
    [[ $# -ne 0 ]] && eval "${menu[$1]}" || echo "${!menu[*]}"
}

main $@

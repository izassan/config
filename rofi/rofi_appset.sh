#!/usr/bin/env bash

set -euCo pipefail

function terminal_and_browser(){
    i3-sensible-terminal
    google-chrome-stable 2>&1 1>/dev/null
}

function main() {
  local -Ar menu=(
    ['terminal+browser']='terminal_and_browser'
  )

  local -r IFS=$'\n'
  if [[ $# -ne 0 ]];then
      eval "${menu[$1]}"
  else
      echo "${!menu[*]}"
  fi
}

main $@

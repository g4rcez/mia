#!/bin/bash

# Foreground colors on terminal
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

# Background colors on terminal
export BG_COLOR="\e[49m"
export BG_COLOR_BLACK="\e[40m"
export BG_COLOR_RED="\e[41m"
export BG_COLOR_GREEN="\e[42m"
export BG_COLOR_YELLOW="\e[43m"
export BG_COLOR_BLUE="\e[44m"
export BG_COLOR_MAGENTA="\e[45m"
export BG_COLOR_CYAN="\e[46m"
export BG_COLOR_WHITE="\e[107m"

# Text Effects
export BOLD='\e[1m'
export DIM='\e[2m'
export UNDERLINE='\e[4m'
export REVERSE="\e[5m"
export HIDDEN="\e[6m"
export RESET="\e[0m"

init(){
  export command=$(cat $(pwd)/mind.json | jq -r ".$1.path")
}

banner(){
  echo -e "
  ███╗   ███╗    ██╗     █████╗
  ████╗ ████║    ██║    ██╔══██╗
  ██╔████╔██║    ██║    ███████║
  ██║╚██╔╝██║    ██║    ██╔══██║
  ██║ ╚═╝ ██║    ██║    ██║  ██║
  ╚═╝     ╚═╝    ╚═╝    ╚═╝  ╚═╝"
}

contains(){
  if [[ "$(echo "$1" | grep "$2")" != "" ]]; then
    return 0
  fi
  return 1
}

replace(){
  echo "$3" | sed "s/$1/$2/g"
}

what(){
  if [[ "$2" == "what" ]]; then
    echo -e "${COLOR_GREEN}${BOLD}${1}:${COLOR_NC}${RESET} $(cat "$(pwd)/mind.json" | jq -r .$1.action)" && exit
  fi
}

packageManager(){
  if [[ -e "$(which apt 2>/dev/null)" ]]; then
    install(){
      apt install "$@"
    }
  elif [[ -e "$(which yum 2>/dev/null)" ]]; then
    install(){
      yum install "$@"
    }
  elif [[ -e "$(which pacman 2>/dev/null)" ]]; then
    install(){
      pacman -S "$@" --noconfirm
    }
  fi
  "$@"
}

help(){
  if [[ "$2" == "help" ]]; then
    banner && echo
    cat "$(cat "$(pwd)/mind.json" | jq -r .$1.help)" && exit
  fi
}

if [[ "$#" -eq 0 ]];then
  banner && cat man/help.md
  exit
fi

export -f contains banner replace packageManager help
help "$@" && what "$@"
init "$@"
if [[ "$command" == "null" ]]; then
  echo "Não foi encontrado o comando..."
  exit
fi
chmod +x "$command" && shift && ./$command $@

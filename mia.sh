#!/bin/bash

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

export -f contains banner
init "$@" && chmod +x "$command" && shift && ./$command $@


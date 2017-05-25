#!/bin/bash
endOfProgram(){
  echo -e "\033[01;31mOperação somente realizada pelo root\033[0m" && exit
} && test "$(whoami)" == "root" && echo -e "\033[05;01;37mInstalando...\033[0m" || endOfProgram

getExecMiaPath(){
  whereMia=$(echo "$0"|sed 's/^ \+//'|sed 's@./@&\n@g;'|sed '$d'|tr -d '\n')
  if [[ "$whereMia" == "./" ]]; then
    whereMia=""
  fi
}

install(){
  exec="$(basename $1)"
  ls "${whereMia}" | sed '/install.sh/d' | sed "s@.*@cp -dRv ${whereMia}& /usr/bin/&@g"
}

if [[ "$1" == "install" ]] || [[ "$1" == "" ]]; then
  echo -e "Instalação padrão...Seu interpretador será Bash."
  getExecMiaPath && echo
  install "$whereMia" 'bash'
fi

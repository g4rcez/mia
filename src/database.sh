#!/bin/bash

//* TODO: fix password change


if [[ "$(whoami)" == 'root' ]]; then
  for palavra in $*; do
    string=( ${string[@]} "$palavra")
  done
  parametros=${string[@]:0}
  password=$(echo "$parametros"|tr -d " ")
  while [[ "$password" == "" ]]; do
    read -p "Informe a senha do DB: " password
  done
  systemctl stop mysql
  systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"
  systemctl start mysql
  echo "UPDATE mysql.user SET authentication_string = PASSWORD('$password')
      -> WHERE User = 'root' AND Host = 'localhost';" | mysql -u root
  echo "FLUSH PRIVILEGES;" | mysql -u root
  systemctl stop mysql
  systemctl unset-environment MYSQLD_OPTS
  systemctl start mysql
  mysql -u root -p$password
else
  echo -e "${COLOR_RED}${BOLD}É necessário ser root para realizar esta operação"
  exit
fi

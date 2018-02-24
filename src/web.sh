react(){
    npmPath="$(which npm 2>&1)"
    reactAppPath="$(which create-react-app 2>&1)"
    if [[ ! -e "$npmPath" ]] && [[ ! -e "$reactAppPath" ]] ; then
        sudo npm install -g create-react-app
    else
        create-react-app $1
        cd $1
        npm install --save axios immutable jwt-decode moment ramda react-router redux
        rm -rf node_modules
        npm install
        if [[ "$3" == "start" ]]; then
            npm start
        fi
    fi
}

indent(){
    for file in "$@"; do
        sed 's/{/{\n/g' "$1" | sed 's/}/\n}\n/g' |\
        sed 's/;/;\n/g' | sed '/^$/d'| sed '/{\|}/!s/.*/\t&/g' | sed '/^$/d; s/^\t$//g' > "$file.indent"
    done
}

minify(){
    for file in "$@"; do
        sed ':a;$!N;s/\n//;ta;' "$1" | tr -s ' \t \n' > "$file.min"
    done
}

$@

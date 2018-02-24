hex(){
    echo -n "$@" | od -A n -t x1 | tr -d ' '
}

b64(){
    if [[ "$(echo "$@" | grep "\-d")" != "" ]]; then
        echo "$@" | sed 's/-d//g' | sed 's/^ \+//' | base64 -d 2>/dev/null 
    else
        echo "$@" | base64
    fi
}

bin(){
    echo "$@"
    python -c "print(''.join([format(ord(char),'#010b')[2:] for char in '$@']))"
}

if [[ "$1" == "base64" ]]; then
    shift
    b64 $@ 
else
    $@
fi

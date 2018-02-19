#!/bin/bash

if [[ "$1" == "help" ]]; then
    banner && echo
    file="$(cat "$(pwd)/mind.json" | jq -r .check.help)"
    cat "$file"
    exit
fi

hashs=($(echo "$@" | xargs -n1 | sed -n '/-h/p' | sed 's/-h//g'))
hashAlgos=(
    "md5sum"
    "sha1sum" 
    "sha224sum" 
    "sha256sum" 
    "sha384sum" 
    "sha512sum"
)


for file in "$@"; do
    if [[ -e "$file" ]]; then
        for fileHash in "${hashAlgos[@]}"; do
            for hashComparator in "${hashs[@]}"; do
                tempHash="$($fileHash $file | cut -d ' ' -f1)"
                if contains "$tempHash" "$hashComparator"; then  
                    echo "[$fileHash] Compatível com o arquivo: $file => $tempHash"
                fi
            done
        done
    fi
done

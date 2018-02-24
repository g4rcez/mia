#!/bin/bash

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
                    echo -e "${COLOR_GREEN}${BOLD}[$fileHash]${RESET}${COLOR_NC} Arquivo integro ${UNDERLINE}$1${RESET} => $2"
                fi
            done
        done
    fi
done

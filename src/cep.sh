for cep in "$@"; do    
    if [[ "$(echo -n "$cep" | tr -d '\-. ' | wc -c)" == "8" ]]; then
        curl -s "http://api.postmon.com.br/v1/cep/$cep" --user-agent 'Mozilla x64_Firefrogs' | jq
    fi
done

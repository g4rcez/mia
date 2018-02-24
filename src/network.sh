routes="$(ip route | grep -v 'linkdown' | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}\/([0-9]){2}' -wo)"
for route in $routes; do
    echo ">>> Analisando rede: $route"
    scanning="$(nmap "$route" -T3 -sT -p22,80,8080,81,8081,53)"
    hosts="$(echo "$scanning" | grep "report" | grep -Ewo '([0-9]{1,3}\.){3}[0-9]{1,3}')"
    for host in $hosts; do
        echo "$host"
    done
done


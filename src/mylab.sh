start(){
    systemctl start docker
}

status(){
    systemctl status docker
}

run="docker run"
attach="docker attach"
inspect="docker inspect"

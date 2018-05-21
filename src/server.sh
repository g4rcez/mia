ssh(){
    configure(){
        install
        cat /etc/ssh/sshd_config  | sed '/^#/!s/.*/# &/g'
        echo "############## Custom Mia Configs ##############"
        echo "Port 22 # Porta de acesso ao SSH"
        echo "LogLevel INFO"
        echo "SyslogFacility AUTH"
        echo "LoginGraceTime 10s # Tempo para login"
        echo "PermitRootLogin no # Não permite conexão root"
        echo "StrictModes yes"
        echo "MaxAuthTries 3 # Máximo de tentativas"
        echo "MaxSessions 5 # Máximo de sessões"
        echo "PubkeyAuthentication yes # Autenticação com chave pública"
        echo "PasswordAuthentication no # Autenticação com senha desabilitada"
        echo "PermitEmptyPasswords no # Não permitir senhas vazias"
    }

    install(){
        if [[ ! -e "/etc/ssh/sshd_config" ]]; then
            packageManager install openssh
        fi
    }

    if [[ "$1" != "configure" ]]; then
        help "server" "help"
        banner
    fi
    $@
}

nginx(){
    configure(){
        install
    }

    install(){
        if [[ ! -e "/etc/nginx/nginx.conf" ]]; then
            packageManager install nginx
        fi
    }
}

$@

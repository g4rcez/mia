# Mia
#### A Assistente Virtual da Linha de Comando
##### Desenvolvedor: VandalVNL
##### Linguagem utilizada: Bourne Shell Again (Bash)
##### Versão atual: 2.0.1
##### Licença: GPL
##### Ambiente de Teste: Manjaro Linux, CentOS e Debian

### Chamada da ferramenta
> uname@kurupira[~]: mia (comando) ...(parâmetros)...

- Versão 1.0.0:
Versão Alpha com a emulação de uma gerente de processos. Possuindo 16 funções,
utilizada somente sob argumentos na linha de comando, não interativa.

- Versão 2.0.0:
Versão com melhorias no desempenho e código. Agora a forma de se trabalhar com
funções, argumentos e interatividade do usuário está de forma mais dinâmica e
ágil. Você pode usar os módulos de 'conteiner' para escrever suas próprias funções
quando desejar.

### Descrição da Ferramenta
M.I.A é uma assistente virtual feita para trabalhar no ambiente em modo texto.
Executa comandos para facilitar a rotina do usuário, seja em tarefas simples,
complexas e repetitivas.

#### Funções para análises
> M.I.A possui algumas funções que podem auxiliar em Pentest, como por exemplo a função 'scan' para realizar uma varredura em um servidor, a função 'macdiff' para spoof de MAC. A função 'cep' pode retornar algumas informações extras sobre o endereço.

#### Funções Proteção
> M.I.A possui funções que ajudam a hardenizar e otimizar seu 'localhost'. Através da função 'tempo' você identifica o TCP TimeStamp de seu PC. A mesma função, oferece uma possibilidade de criar uma mitigação para esta falha. Caso você esteja em uma rede e quer se proteger de ataques man in the middle, a função 'arpfix' iŕa lhe oferecer uma forma de fixar o atual gateway ou um gateway escolhido, como padrão.

#### Funções Misc
> M.I.A possui funções miscelâneas para o dia a dia, tais como calculadora, pesquisa de nome de cidades, comparação de hash dos arquivos, identificação do IP Externo, renomear extensões de arquivos...


### Dependências
- Bash versão 4.4.12 (não confirmado para versões anteriores)
- Conexão com a internet(para algumas funções)
- Lynx versão 2.8.8
- Nmap versão 7 ou superior
- Python3 (apenas para calculadora)
- Hping3 (Identificação de TCP TimeStamp e montagem de pacotes)


### Relatório de bugs
Link de Download da Ferramenta: [https://github.com/vandalvnl/mia](github.com/vandalvnl/mia)

Link de relatório de bugs: Por favor, utilize a ISSUE no GitHub

### Agradecimentos
Agradecimentos especiais, para:
- Tristão
- G.R
- Tron
- MrZero
- D34dFr4m3
- RuGuy
- UnameTeam


### Licença
O projeto M.I.A foi desenvolvido com o intuito de ajudar a comunidade, com seu código livre, e tendo como base a licença GPL. Mas isso não signfica que você pode úsar o código como se fosse seu, referêncie o trabalho daqueles que desenvolveram o código.

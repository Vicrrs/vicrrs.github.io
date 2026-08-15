# Imagem base: Node.js 20 LTS (versao "slim" = leve).
# O Hexo roda em cima do Node, entao esta e a fundacao de tudo.
FROM docker.io/library/node:20-slim

# Instala o Git (necessario para o hexo init clonar o starter,
# para o tema, e para o deploy no GitHub Pages) e o openssh-client
# (caso voce use chave SSH para o GitHub).
RUN apt-get update \
    && apt-get install -y --no-install-recommends git openssh-client ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Instala o Hexo globalmente dentro do container.
RUN npm install -g hexo-cli

# Pasta onde o seu blog vai viver dentro do container.
# Ela sera "espelhada" para a pasta ./site da sua maquina via docker-compose.
WORKDIR /blog

# Porta padrao do servidor local do Hexo.
EXPOSE 4000

# Comando padrao: sobe o servidor de desenvolvimento acessivel de fora do container.
CMD ["hexo", "server", "-p", "4000", "-i", "0.0.0.0"]

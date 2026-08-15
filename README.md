# Blog Hexo + Icarus via Docker

Ambiente pronto para criar um blog estático igual ao do
[Lei Mao](https://leimao.github.io/) — usando **Hexo** (gerador),
o tema **Icarus** (o visual) e **GitHub Pages** (hospedagem gratuita),
tudo dentro do **Docker** para você não precisar instalar Node, Hexo ou Git
na sua máquina.

## O que já vem incluído no container

- Node.js 20 LTS
- Git + cliente SSH
- Hexo CLI
- Tema Icarus (instalado no `init`)
- Plugin de deploy para o GitHub Pages

## Pré-requisito único

Ter o **Docker** instalado na sua máquina:
https://www.docker.com/products/docker-desktop/

Confira com:

```bash
docker --version
```

## Como usar

Todos os comandos passam pelo script `./blog.sh`.

### 1. Primeira vez (cria o blog + tema)

```bash
./blog.sh init
```

Isso cria a pasta `site/` com todo o seu blog dentro (posts, config, tema).
Essa pasta fica na SUA máquina, então nada se perde se o container for apagado.

### 2. Ver o site rodando localmente

```bash
./blog.sh server
```

Abra **http://localhost:4000** no navegador. O site atualiza sozinho
enquanto você edita.

### 3. Escrever um post

```bash
./blog.sh new "Meu Primeiro Post"
```

O arquivo aparece em `site/source/_posts/Meu-Primeiro-Post.md`.
Abra em qualquer editor de texto e escreva em **Markdown**. No topo há um
bloco (o "front matter") onde você define título, data, categorias e tags:

```markdown
---
title: Meu Primeiro Post
date: 2026-08-14 10:00:00
categories:
  - blog
tags:
  - Machine Learning
  - CUDA
---

Aqui vai o conteúdo do post em Markdown normal.
```

### 4. Customizar o visual (foto, redes sociais, menu)

Edite o arquivo `site/_config.icarus.yml`. Lá você configura:
- sua foto e bio na barra lateral
- links de GitHub, LinkedIn, X, e-mail, etc.
- itens do menu no topo
- esquema de cores

E edite `site/_config.yml` para o título do site, seu nome e a URL.

### 5. Publicar no GitHub Pages

1. Crie um repositório no GitHub com o nome **`seu-usuario.github.io`**.
2. No arquivo `site/_config.yml`, configure o deploy:

   ```yaml
   deploy:
     type: git
     repo: https://github.com/seu-usuario/seu-usuario.github.io.git
     branch: main
   ```

3. Rode:

   ```bash
   ./blog.sh deploy
   ```

Em poucos minutos o site estará no ar em `https://seu-usuario.github.io`.

## Todos os comandos

| Comando              | O que faz                                        |
|----------------------|--------------------------------------------------|
| `./blog.sh init`     | Configuração inicial (cria o blog + Icarus)      |
| `./blog.sh server`   | Roda o site local em http://localhost:4000       |
| `./blog.sh new "X"`  | Cria um novo post chamado X                       |
| `./blog.sh build`    | Gera o HTML final em `site/public/`              |
| `./blog.sh deploy`   | Publica no GitHub Pages                          |
| `./blog.sh shell`    | Abre um terminal dentro do container             |

## Estrutura de pastas

```
hexo-docker/
├── Dockerfile           # define a imagem (Node + Git + Hexo)
├── docker-compose.yml   # liga a porta 4000 e espelha ./site
├── .dockerignore
├── blog.sh              # atalhos para os comandos
├── README.md            # este arquivo
└── site/                # SEU BLOG (criado pelo ./blog.sh init)
    ├── _config.yml          # config do site
    ├── _config.icarus.yml   # config do tema
    └── source/_posts/       # seus posts em Markdown
```

## Dica

Sempre teste com `./blog.sh server` antes de publicar com `./blog.sh deploy`.
Assim você nunca erra na frente do mundo.

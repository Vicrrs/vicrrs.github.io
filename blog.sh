#!/usr/bin/env bash
set -e
IMAGE="hexo-blog"
if command -v podman >/dev/null 2>&1; then ENGINE="podman"
elif command -v docker >/dev/null 2>&1; then ENGINE="docker"
else echo "ERRO: nem Podman nem Docker encontrados."; exit 1; fi
echo "(usando: $ENGINE)"
SITE_DIR="$(pwd)/site"
run_in_container() {
  "$ENGINE" run --rm -it -v "$SITE_DIR:/blog:Z" -p 4000:4000 --entrypoint "" "$IMAGE" "$@"
}
case "$1" in
  init)
    echo ">> Construindo a imagem ..."
    "$ENGINE" build -t "$IMAGE" .
    echo ">> Inicializando o blog em ./site ..."
    mkdir -p site
    run_in_container sh -c "hexo init . && npm install && npm install hexo-theme-icarus && npm install hexo-deployer-git && hexo config theme icarus"
    echo ""; echo ">> Pronto! Agora rode:  ./blog.sh server" ;;
  server|serve)
    echo ">> http://localhost:4000  (Ctrl+C para parar)"
    run_in_container hexo server -p 4000 -i 0.0.0.0 ;;
  new) shift; run_in_container hexo new post "$@"; echo ">> Post criado em site/source/_posts/" ;;
  build|generate) run_in_container sh -c "hexo clean && hexo generate"; echo ">> Gerado em site/public/" ;;
  deploy) run_in_container sh -c "hexo clean && hexo deploy" ;;
  image) "$ENGINE" build -t "$IMAGE" . ;;
  shell|bash) run_in_container bash ;;
  *)
    echo "Comandos: init | server | new \"X\" | build | deploy | image | shell" ;;
esac

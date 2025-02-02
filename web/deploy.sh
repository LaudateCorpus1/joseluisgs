#!/usr/bin/env sh

# quitamos los errores
set -e

# borramos
rm -rf docs/.vuepress/dist

# build
npm run build

# copiamos readme y license
cp README.md docs/.vuepress/dist
cp LICENSE docs/.vuepress/dist

# cambiamos al directorio
cd docs/.vuepress/dist

# Inicializamos el reposotorio
git init

# Añadimos los ficheros y hacemos comit en main
git add -A
date=`date +%Y-%m-%d_%H:%M:%S`
git commit -m "deploy ${date}"
git branch -M main

# Nos conectamos a remoto y subimos
git remote add origin https://github.com/joseluisgs/joseluisgs.github.io.git
git push -u -f origin main
# git push -u origin main

cd -

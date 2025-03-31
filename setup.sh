#!/bin/bash

# Clona el repositorio temporalmente
git clone --depth=1 https://github.com/al3xar/term_setup.git /tmp/term_setup
cd /tmp/term_setup

# Ejecuta el código que necesite los archivos del repo
./start.sh

# Limpia el repositorio clonado
cd -
rm -rf /tmp/term_setup

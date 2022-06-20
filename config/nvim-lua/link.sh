#!/bin/bash

rm -rf ~/.config/nvim/*
mkdir -p ~/.config/nvim

for file in `find * -type f ! -name '*.sh'`; do 
    echo $file

    mkdir -p ~/.config/nvim/$(dirname "$file")

    ln -sf $(realpath "$file") ~/.config/nvim/$file
done

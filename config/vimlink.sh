#!/bin/bash

mkdir -p ~/.config/nvim

for file in `find nvim -regex ".*\.vim$"`; do
	rm -rf ~/.config/$file
	FULL_PATH="$(cd "$(dirname "$file")"; pwd)/$(basename "$file")"

	ln -s $FULL_PATH ~/.config/$file
done


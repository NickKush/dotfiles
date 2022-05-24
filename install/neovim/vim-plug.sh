#!/bin/bash

# Install plug vim instantly
# From: https://github.com/junegunn/vim-plug/blob/master/README.md > Unix, Linux section
# In the differemt file, because I can't figure out how to install it with `sudo` priviligies

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
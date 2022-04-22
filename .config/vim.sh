#!/bin/bash

# Make sure we start this script with sudo/root 
if [[ $EUID -ne 0 ]]; then
   echo "install.sh must be run as root"
   exit 1
fi

# Install neovim
add-apt-repository ppa:neovim-ppa/stable && \
  apt update && \
  apt --no-install-recommends install -yq \
    neovim

# Link neovim in vim shortcut
ln -sf $(which nvim) /usr/local/bin/vim

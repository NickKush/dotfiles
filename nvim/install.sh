#!/bin/bash

# Download the latest version of neovim
# https://github.com/neovim/neovim
# 
# We can't download it directly from PPA, because it's not been updated...

# Make sure we start this script with sudo/root 
if [[ $EUID -ne 0 ]]; then
   echo "neovim install.sh must be run as root"
   exit 1
fi

# # Install neovim
TEMP_FOLDER="/tmp/neovim_download"

DOWNLOAD_URL=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest \
    | grep "browser_download_url" \
    | grep "nvim-linux64.deb\"$" \
    | cut -d '"' -f 4
)

mkdir -p ${TEMP_FOLDER} && \
    curl -s -L --create-dirs -o ${TEMP_FOLDER}/nvim-linux64.deb "$DOWNLOAD_URL" && \
    dpkg --install --force-overwrite ${TEMP_FOLDER}/nvim-linux64.deb    

rm -rf ${TEMP_FOLDER}

# Link neovim in vim shortcut
ln -sf $(which nvim) /usr/local/bin/vim


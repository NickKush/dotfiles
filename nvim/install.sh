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

mkdir -p ${TEMP_FOLDER}

curl -L --output ${TEMP_FOLDER}/nvim-linux64.deb "$DOWNLOAD_URL" && \
dpkg --install --force-overwrite ${TEMP_FOLDER}/nvim-linux64.deb    

# curl -sLo --create-dirs ${TEMP_FOLDER}/nvim-linux64.deb "$DOWNLOAD_URL" && \
# dpkg --install --force-overwrite ${TEMP_FOLDER}/nvim-linux64.deb    

rm -rf ${TEMP_FOLDER}

# Link neovim in vim shortcut
ln -sf $(which nvim) /usr/local/bin/vim


## Install fg for telescope
curl -sLO "https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb"
dpkg --install --force-overwrite ripgrep_13.0.0_amd64.deb
rm -f ripgrep_13.0.0_amd64.deb


## Install fd for telescope
curl -sLO "https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-musl_8.4.0_amd64.deb"
dpkg --install --force-overwrite fd-musl_8.4.0_amd64.deb
rm -f fd-musl_8.4.0_amd64.deb

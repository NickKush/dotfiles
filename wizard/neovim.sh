#!/bin/bash
set -o xtrace

# Download and install the latest version of neovim
# https://github.com/neovim/neovim
#
# We can't download it directly from PPA, because it's not been updated...

# Make sure we start this script with sudo/root
if [[ $EUID -ne 0 ]]; then
    echo "neovim install.sh must be run as root"
    exit 1
fi

# Version 0.9.5
DOWNLOAD_URL=$(
    curl -s https://api.github.com/repos/neovim/neovim/releases/tags/v0.10.2 |
        grep "browser_download_url" |
        grep "nvim.appimage\"$" |
        cut -d '"' -f 4
)

curl -sLO "$DOWNLOAD_URL" &&
    cp -f nvim.appimage /usr/local/bin/vim &&
    chmod +x /usr/local/bin/vim &&
    rm -f nvim.appimage

# # Install fg for telescope
curl -sLO "https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb"
dpkg --install --force-overwrite ripgrep_14.1.0-1_amd64.deb
rm -f ripgrep_14.1.0-1_amd64.deb

# Install fd for telescope
# curl -sLO "https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-musl_8.4.0_amd64.deb"
# dpkg --install --force-overwrite fd-musl_8.4.0_amd64.deb
# rm -f fd-musl_8.4.0_amd64.deb

#!/bin/bash

# Make sure we start this script with sudo/root
if [[ $EUID -ne 0 ]]; then
    echo "this script must be run as root"
    exit 1
fi

echo "Updating packages..."
apt update -y

echo "Install essential packages..."
apt install -y cmake build-essential curl xclip vim wget npm tmux openconnect lua5.4

# echo "Install stuff"
# for i in lazygit nvim; do
#     cd $i && bash install.sh
#     cd -
# done
#

# Alacrity dependencies
apt install -y libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev

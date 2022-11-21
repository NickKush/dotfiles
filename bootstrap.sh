#!/bin/bash

# Make sure we start this script with sudo/root 
if [[ $EUID -ne 0 ]]; then
   echo "this script must be run as root"
   exit 1
fi

echo "Updating packages..."
apt update -y

echo "Install essential packages..."
apt install -y curl xclip vim wget build-essential npm tmux

echo "Install stuff"
for i in lazygit nvim; do
    cd $i && bash install.sh
    cd -
done

echo "Setup configuration"
for i in lazygit nvim tmux; do
    cd $i && bash setup.sh
    cd -
done


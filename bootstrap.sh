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
apt install -y python3-dev python3-venv

# Virtual machine stuff
apt install -y qemu-kvm libvirt-daemon-system

# Alacrity dependencies
apt install -y libfreetype6-dev libfontconfig1-dev libxcb-xixes0-dev libxkbcommon-dev

# echo "Install stuff"
# for i in lazygit nvim; do
#     cd $i && bash install.sh
#     cd -
# done
#

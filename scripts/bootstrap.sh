#!/bin/bash

# Make sure we start this script with sudo/root
if [[ $EUID -ne 0 ]]; then
    echo "this script must be run as root"
    exit 1
fi

echo "Updating packages..."
apt update -y

echo "Install essential packages..."
apt install -y cmake build-essential curl xclip vim wget tmux openconnect fzf

echo "Install programming stuff..."
apt install -y python3-dev python3-venv lua5.4 npm

echo "Install gnome specific stuff..."
apt install -y network-manager-openconnect network-manager-openconnect-gnome

echo "Install virtual machine stuff..."
apt install -y qemu-kvm libvirt-daemon-system

echo "Install Alacrity dependencies..."
apt install -y libfreetype6-dev libfontconfig1-dev libxcb-xixes0-dev libxkbcommon-dev

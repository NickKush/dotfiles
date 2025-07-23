#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "$SCRIPT_DIR/functions.sh"

# TODO arch:
# - check and fix vm dependencies
# - check alacrity dependencies
function install_essentials() {
    update_packages

    echo "Installing based packages..."
    install_package cmake curl xclip wget vim tmux fzf

    echo "Installing dev packages..."
    install_package npm

    if is_debian; then
        echo "Installing debian specific packages"
        install_package build-essential network-manager-openconnect network-manager-openconnect-gnome \
            python3-dev python3-venv lua5.4

        echo "Install VM stuff..."
        install_package qemu-kvm libvirt-daemon-system

        echo "Installing Alacrity dependencies..."
        install_package libfreetype6-dev libfontconfig1-dev libxcb-xixes0-dev libxkbcommon-dev
    fi

    if is_arch; then
        echo "Installing arch specific packages"
        install_package base-devel lua unzip

        # TODO: fix me later
        # echo "Install VM stuff..."
        # install_package virt-manager
    fi
}

function start() {
    ensure_sudo
    get_os

    # Installing base packages
    install_essentials
}

start

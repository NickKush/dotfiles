#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source "$SCRIPT_DIR/../functions.sh"

function install_ubuntu() {
    # Docker install
    # https://docs.docker.com/engine/install/ubuntu/
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
        sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

    update_packages
    install_package docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

function install_arch() {
    install_package docker
}

if is_debian; then
    install_ubuntu
elif is_arch; then
    install_arch
fi

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

#!/bin/bash

declare -g OS_NAME OS_DISTRO

function ensure_sudo() {
    # Make sure we are root
    if [[ $EUID -eq 0 ]]; then
        return
    fi

    if [[ -z $@ ]]; then
        echo "You have to be root"
    else
        echo "You have to be root to $@"
    fi

    exit 1
}

# Get OS name and distro
# Set variables:
#   - OS_NAME
#   - OS_DISTRO
function get_os {
    source /etc/os-release

    if [[ $ID_LIKE == *"debian"* || $ID_LIKE == *"ubuntu"* ]]; then
        OS_NAME=${NAME}
        OS_DISTRO="debian"
    elif [[ $ID_LIKE == *"arch"* ]]; then
        OS_NAME=${NAME}
        OS_DISTRO="arch"
    else
        echo "Unsupported OS \"$NAME\" and Distro \"$ID\"" 1>&2
        exit 1
    fi

    declare -xr OS_NAME
    declare -xr OS_DISTRO
}

function is_debian() {
    if [[ -z $OS_DISTRO ]]; then
        get_os
    fi
    [[ $OS_DISTRO == "debian" ]]
}

function is_arch() {
    if [[ -z $OS_DISTRO ]]; then
        echo "distro is not set"
        get_os
    fi
    [[ $OS_DISTRO == "arch" ]]
}

function install_package() {
    ensure_sudo "install packages"

    if [[ -z $OS_DISTRO ]]; then
        get_os
    fi

    case $OS_DISTRO in
    ubuntu)
        apt install -y $@
        ;;
    arch)
        pacman --noconfirm -S $@
        ;;
    *)
        echo "Unsupported OS \"$NAME\" to install packages" 1>&2
        exit 1
        ;;
    esac
}

function update_packages() {
    if is_debian; then
        apt update
    fi
}

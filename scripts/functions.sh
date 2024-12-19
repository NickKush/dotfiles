#!/bin/bash

function ensure_sudo() {
    # Make sure we start this script with sudo/root
    if [[ $EUID -ne 0 ]]; then
        echo "You must to be root"
        exit 1
    fi
}

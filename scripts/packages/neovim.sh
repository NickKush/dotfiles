#!/bin/bash
# Download and install the latest version of neovim
# https://github.com/neovim/neovim
#
# We can't download it directly from PPA, because it's not been updated...

# Import common functions
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source "$SCRIPT_DIR/../functions.sh"

NEOVIM_URL="https://api.github.com/repos/neovim/neovim/releases"
NEOVIM_VERSION="v0.11.4"

function list_tags() {
    tags_result=$(curl -s "$NEOVIM_URL" | grep "tag_name" | cut -d '"' -f 4)
    readarray -t array <<<"$tags_result"

    limit=10

    for index in "${!array[@]}"; do
        echo "${array[index]}"

        if (($index >= $limit - 1)); then
            break
        fi
    done
}

function install_neovim() {
    ensure_sudo

    download_url=$(
        curl -s "$NEOVIM_URL/tags/$NEOVIM_VERSION" |
            grep "browser_download_url" |
            grep "nvim.*linux.*x86.*appimage\"$" |
            cut -d '"' -f 4
    )

    curl -sL -o nvim.appimage "$download_url" &&
        cp -f nvim.appimage /usr/local/bin/vim &&
        chmod +x /usr/local/bin/vim &&
        rm -f nvim.appimage

    # fd for neovim plugins
    curl -sLO "https://github.com/sharkdp/fd/releases/download/v10.3.0/fd-musl_10.3.0_amd64.deb" &&
        dpkg --install --force-overwrite fd-musl_10.3.0_amd64.deb &&
        rm -f fd-musl_10.3.0_amd64.deb
}

function echo_help() {
    cat <<EOL
The installer for NeoVIM
Current version: $NEOVIM_VERSION

Usage: neovim.sh [OPTIONS]

Options:
  -l, --list
        Show list of all tags
  -i, --install
        Install neovim and dependencies. Sudo required.
  -h, --help
        Print help
  -v
        Increase verbosity of output.
EOL
}

main() {
    if is_arch; then
        install_package neovim
        ln -sf $(which nvim) /usr/local/bin/vim
    fi

    if is_debian; then
        if [ $# -eq 0 ]; then
            echo_help
            exit 0
        fi

        while [[ $# -gt 0 ]]; do
            key="$1"

            case $key in
            -h | --help)
                echo_help
                exit 0
                ;;

            -l | --list)
                list_tags
                exit 0
                ;;

            -i | --install)
                install_neovim
                exit 0
                ;;
            --v)
                set -o xtrace
                ;;
            *) # unknown option
                shift
                ;;
            esac
        done
    fi
}

main "$@" || exit 1

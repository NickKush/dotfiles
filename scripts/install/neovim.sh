#!/bin/bash
# Download and install the latest version of neovim
# https://github.com/neovim/neovim
#
# We can't download it directly from PPA, because it's not been updated...

# Import common functions
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source "$SCRIPT_DIR/../functions.sh"

URL="https://api.github.com/repos/neovim/neovim/releases"
VERSION="v0.11.1"

function list_tags() {
    tags_result=$(curl -s "$URL" | grep "tag_name" | cut -d '"' -f 4)
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
        curl -s "$URL/tags/$VERSION" |
            grep "browser_download_url" |
            grep "nvim.*linux.*x86.*appimage\"$" |
            cut -d '"' -f 4
    )

    curl -sL -o nvim.appimage "$download_url" &&
        cp -f nvim.appimage /usr/local/bin/vim &&
        chmod +x /usr/local/bin/vim &&
        rm -f nvim.appimage

    # install_deps
}

# NOTE: don't need this, i don't use telescope anymore.
# delete later if not used somewhere else...
# function install_deps() {
# ensure_sudo
#
# # Install fg for telescope
# curl -sLO "https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb"
# dpkg --install --force-overwrite ripgrep_14.1.0-1_amd64.deb
# rm -f ripgrep_14.1.0-1_amd64.deb
#
# # Install fd for telescope
# curl -sLO "https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-musl_8.4.0_amd64.deb"
# dpkg --install --force-overwrite fd-musl_8.4.0_amd64.deb
# rm -f fd-musl_8.4.0_amd64.deb
# }

function echo_help() {
    cat <<EOL
The installer for NeoVIM

Usage: neovim.sh [OPTIONS]

Options:
  -l, --list
        Show list of all tags
  -i, --install
        Install neovim and dependencies. Sudo required.
        Current version: $VERSION
  -h, --help
        Print help
  -v
        Increase verbosity of output.
EOL
}

main() {
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
}

main "$@" || exit 1

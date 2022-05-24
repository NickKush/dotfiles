#!/bin/bash

# Download the latest version of lazygit
# https://github.com/jesseduffield/lazygit
# 
# We can't download it directly from PPA, because it's been deprecated


# Make sure we start this script with sudo/root 
if [[ $EUID -ne 0 ]]; then
   echo "lazygit.sh must be run as root"
   exit 1
fi


TEMP_FOLDER="/tmp/lazygit_download"

DOWNLOAD_URL=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest \
    | grep "browser_download_url" \
    | grep Linux_x86_64.tar.gz \
    | cut -d '"' -f 4
)

mkdir -p ${TEMP_FOLDER} && \
    curl -s -L --create-dirs -o ${TEMP_FOLDER}/lazygit.tar.gz "$LAZYGIT_URL" && \
    tar -xf ${TEMP_FOLDER}/lazygit.tar.gz -C ${TEMP_FOLDER} lazygit && \
    cp ${TEMP_FOLDER}/lazygit /usr/local/bin/lazygit

rm -rf ${TEMP_FOLDER}

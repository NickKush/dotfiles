#!/bin/bash
set -o xtrace

# Install and manage golang
if [[ $EUID -ne 0 ]]; then
	echo "Must be root"
	exit 1
fi

FOLDER="/tmp/go"
URL="https://go.dev/dl/go1.23.0.linux-amd64.tar.gz"

curl -s -L --create-dirs -o ${FOLDER}/go.tar.gz "$URL" &&
	rm -rf /usr/local/go &&
	tar -C /usr/local -xzf ${FOLDER}/go.tar.gz

export PATH=$PATH:/usr/local/go/bin
go version

echo 'Add this line in .bashrc file'
echo 'export PATH=$PATH:/usr/local/go/bin'

#!/bin/bash
set -o xtrace

# Build alacritty
# https://github.com/alacritty/alacritty/blob/master/INSTAll.md

if ! cargo -v &>/dev/null; then
	echo "Cargo is not installed."
	exit 1
fi

FOLDER="/tmp/alacrity"

if [ -d $FOLDER ]; then
	echo "Directory exists. Removing..."
	rm -rf $FOLDER
fi

mkdir $FOLDER
cd $FOLDER
echo "Current directory: $PWD"

# Version 0.13.2
git clone --depth 1 --branch v0.13.2 https://github.com/alacritty/alacritty.git
cd alacritty

cargo build --release

# Desktop Entry
echo "Create desktop entry"
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Shell completion
echo "Configurate bash completion"
mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >>~/.bashrc

echo "Dome. Remove folder $FOLDER"
rm -rf $FOLDER

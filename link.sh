#!/bin/bash

if [[ $EUID -eq 0 ]]; then
	echo "Linking configs for root user"
	exit 1
else
	echo "Linking configs for normal user"
fi

# for i in lazygit nvim tmux; do
#     echo "setup config for $i"
#     cd $i && bash setup.sh
#     cd -
# done

# Git config
echo "Setup Git config"

# TODO: Check if submodule is present
ln -sf $PWD/personal/gitconfig $HOME/.gitconfig
ln -sf $PWD/.ideavimrc  $HOME/.ideavimrc


# Neovim
echo "Setup Neovim"

rm -rf ~/.config/nvim/*
mkdir -p ~/.config/nvim
ln -sf $PWD/nvim/* $HOME/.config/nvim/


# Tmux
echo "Setup Tmux"

ln -sf $PWD/tmux/tmux.conf $HOME/.tmux.conf

# Alacritty
echo "Setup Alacritty"

rm -rf ~/.config/alacritty/*
mkdir -p ~/.config/alacritty
ln -sf $PWD/alacritty/* $HOME/.config/alacritty/


# Awesome
echo "Setup Awesome"

rm -rf ~/.config/awesome/*
mkdir -p ~/.config/awesome
ln -sf $PWD/awesome/* $HOME/.config/awesome/


#!/bin/bash

rm -rf ~/.config/nvim/*
mkdir -p ~/.config/nvim

ln -sf $PWD/config/* ~/.config/nvim/


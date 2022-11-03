#!/bin/bash

rm -rf ~/.config/awesome/*
mkdir -p ~/.config/awesome

ln -sf $PWD/config/* ~/.config/awesome/


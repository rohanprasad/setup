#!/bin/bash
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)
#
# Desciption

if [ "$OS" == "mac" ]; then
    brew_install_cask visual-studio-code
elif [ "$OS" == "linux" ]; then
    sudo snap install --classic code
else
    echo "Unknown platform"
    exit 1
fi

#!/bin/bash
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)
#
# Description

if [ "$OS" == "mac" ]; then
    brew_install_cask flux
elif [ "$OS" == "linux" ]; then
    sudo add-apt-repository ppa:nathan-renniewaldock/flux
    sudo apt-get update
    sudo apt-get install -y fluxgui
else
    echo "Unknown platform"
    exit 1
fi

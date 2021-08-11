#!/bin/bash
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)
#
# Description: Install the gnome-tweak tools.

if [ "$OS" == "linux" ]; then
    sudo add-apt-repository universe
    sudo apt install gnome-tweak-tool -y
    sudo apt install gnome-shell-extensions -y
fi

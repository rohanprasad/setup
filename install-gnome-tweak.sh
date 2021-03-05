#!/bin/bash
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)
#
# Description: Install the gnome-tweak tools.

sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
sudo apt install $(apt search gnome-shell-extension | grep ^gnome | cut -d / -f1)

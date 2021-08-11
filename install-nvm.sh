#!/bin/bash
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)
#
# Desciption: Script to install nvm

if [ -d "$HOME/.nvm" ]; then
    installed nvm
else
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.37.2/install.sh | bash
fi

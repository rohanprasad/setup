#!/bin/bash
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)
#
# Script to install a tool if not present. Usage: install.sh tool

function detect_system {
  if [ "$(uname)" == "Darwin" ]; then
    echo "Setting up mac"
    OS="mac"
    COPY_COMMAND=pbcopy
    PASTE_COMMAND=pbpaste
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Setting up linux"
    OS="linux"
    COPY_COMMAND=xclip
    PASTE_COMMAND=xclip
  else
    echo "Unknown platform"
    exit 1
  fi
}

function installed {
  echo -e "=> $1 \xE2\x9C\x94"
}

function brew_install_cask {
  if brew ls --cask $1 >/dev/null; then
    installed $1
  else
    brew install --cask $1
  fi
}

function brew_install {
  if brew ls --versions $1 >/dev/null; then
    installed $1
  else
    brew install $1
  fi
}

function install_tool {
  if [ ! $1 ]; then
    echo "No tool specified. Usage: install.sh tool"
    exit 1
  fi

  exists=$(command -v $1)

  if [ ! exists ]; then
    echo "Installing $tool"
    sudo apt-get install $tool
  fi
}

detect_system

. ./basic-tools.sh
. ./install-brew.sh

if [ "$OS" == "mac" ]; then
  brew_install_cask iterm2
fi

. ./install-zsh.sh
. ./install-vscode.sh
. ./install-gnome-tweak.sh
. ./install-flux.sh
. ./install-nvm.sh

git config --global user.email "prasad.rohan93@gmail.com"
git config --global user.name "Rohan Prasad"

. ./create-github-ssh.sh

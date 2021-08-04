#/bin/sh
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)
#
# Script to install a tool if not present. Usage: install.sh tool

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

sh ./basic-tools.sh
sh ./install-vscode.sh
sh ./install-zsh.sh
sh ./install-gnome-tweak.sh
sh ./install-flux.sh
sh ./install-nvm.sh

git config --global user.email "prasad.rohan93@gmail.com"
git config --global user.name "Rohan Prasad"

sh ./create-github-ssh.sh

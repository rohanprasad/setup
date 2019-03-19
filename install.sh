#/bin/sh
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)
#
# Script to install a tool if not present. Usage: install.sh tool

if [ ! $1 ]; then
  echo "No tool specified. Usage: install.sh tool"
  exit 1
fi

exists=$(command -v $1)

if [ ! exists ]; then
  echo "Installing $tool"
  sudo apt-get install $tool
fi

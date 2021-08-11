#!/bin/bash
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)

tools=(git vim curl)

if [ "$OS" == "mac" ]; then
  tools+=()
elif [ "$OS" == "linux" ]; then
  tools+=(xclip)
else
  echo "Unknown platform"
  exit 1
fi

for tool in ${tools[*]}; do
  command -v $tool >/dev/null && installed $tool && continue
  if [ "$OS" == "mac" ]; then
    brew install $tool
  elif [ "$OS" == "linux" ]; then
    sudo apt-get install -y $tool
  else
    echo "Unknown platform"
    continue
  fi
  installed $1
done

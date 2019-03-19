#!/usr/bin/env bash
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)

tools=(git vim xclip)

for tool in ${tools[*]}; do
  command -v $tool >/dev/null && echo -e "$tool \xE2\x9C\x94" && continue || sudo apt-get install -y $tool
  echo -e "$tool \xE2\x9C\x94"
done
      

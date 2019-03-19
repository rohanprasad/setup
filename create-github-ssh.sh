#!/bin/bash
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)
#
# Description: Creates an ssh key using the email to add to github.

echo "Copied to clipboard /home/rohan/.ssh/github_key"
echo -n "/home/rohan/.ssh/github_key" | xclip -selection clipboard

ssh-keygen -t rsa -b 4096 -C "prasad.rohan93@gmail.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/github_key

xclip -sel clip < ~/.ssh/github_key.pub

echo "Public key copied to clipboard. Open https://github.com/settings/ssh/new and add the key"

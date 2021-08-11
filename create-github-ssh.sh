#!/bin/bash
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)
#
# Description: Creates an ssh key using the email to add to github.

key=$HOME/.ssh/github_key
if [ -f "$key" ]; then
    echo "Key already exists"
else
    ssh-keygen -t rsa -b 4096 -C "prasad.rohan93@gmail.com" -f $key
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/github_key
fi

cat $key | $COPY_COMMAND
echo "Public key copied to clipboard. Open https://github.com/settings/ssh/new and add the key"

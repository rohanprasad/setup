#!/bin/bash
#
# Author: Rohan Prasad (prasad.rohan93@gmail.com)
#
# Desciption: Script to install zsh

function install_zsh {
    if [ "$OS" == "mac" ]; then
        brew install zsh
    elif [ "$OS" == "linux" ]; then
        sudo apt-get install -y zsh
    else
        echo "Unknown platform"
        exit 1
    fi

    chsh -s $(which zsh)

    # Install antigen (plugin manager for zsh)
    curl -L git.io/antigen >~/antigen.zsh

    content=$(
        cat <<-END
    source ~/antigen.zsh

    # Load the oh-my-zsh's library.
    antigen use oh-my-zsh

    # Bundles from the default repo (robbyrussell's oh-my-zsh).
    antigen bundle git
    antigen bundle battery
    antigen bundle colorize
    antigen bundle screen
    antigen bundle coloured-man-pages
    antigen bundle command-not-found

    # Syntax highlighting bundle.
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle zsh-users/zsh-autosuggestions

    # Install theme
    antigen theme romkatv/powerlevel10k

    # Tell Antigen that you're done.
    antigen apply

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

END
    )

    echo "$content" >~/.zshrc
}

if [ ! "$(zsh --version)" ]; then
    echo "installing zsh"
    install_zsh
else
    installed zsh
fi

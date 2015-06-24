#!/bin/bash

CFGROOT=$(pwd)

if [[ ! -e $HOME/.oh-my-zsh ]]; then
    echo "Removing zsh config (if present) ..."
    unlink $HOME/.zshrc

    echo "Downloading Oh-My-Zsh ..."
    cd $HOME
    wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | bash
fi

echo "Installing zsh ..."
ln -fs $CFGROOT/shell/zshrc $HOME/.zshrc


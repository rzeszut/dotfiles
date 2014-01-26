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
ln -fs $CFGROOT/shell/zsh/zshrc $HOME/.zshrc
ln -fs $CFGROOT/shell/zsh/themes $HOME/.oh-my-zsh/custom/themes
ln -fs $CFGROOT/shell/zsh/plugins $HOME/.oh-my-zsh/custom/plugins


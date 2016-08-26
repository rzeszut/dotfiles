#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_zsh () {
    echo_yellow ">>> Installing zsh ..."
    sudo apt-get install -y zsh zsh-doc
}

# Main
font_yellow &&\
    prompt ">>> Do you want to install zsh?" &&\
    font_normal &&\
    install_zsh

exit 0


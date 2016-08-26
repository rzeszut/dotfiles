#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_git () {
    echo_yellow ">>> Installing git ..."
    sudo apt-get install -y git
}

install_git_ui () {
    echo_yellow ">>> Installing GUI tools for git ..."
    sudo apt-get install -y gitk git-gui
}

# Main
install_git

font_yellow &&\
    prompt ">>> Do you want to install GUI tools for git?" &&\
    font_normal &&\
    install_git_ui

exit 0


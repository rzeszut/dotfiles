#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
configure_git () {
    echo_yellow ">>> Configuring git ..."
    ln -fs ${CFGROOT}/config/git/gitconfig ${HOME}/.gitconfig
}

# Main
configure_git

exit 0


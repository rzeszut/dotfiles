#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_emacs () {
    echo_yellow ">>> Installing emacs ..."
    sudo apt-get install -y emacs
}

# Main
install_emacs

exit 0

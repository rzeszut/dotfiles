#!/bin/bash

# Imports
source ${CFGROOT}/setup/setup-functions.sh

# Functions
install_emacs () {
    echo_yellow ">>> Installing emacs ..."
    install_on_macos --cask emacs
    install_on_linux emacs
}

# Main
install_emacs

exit 0

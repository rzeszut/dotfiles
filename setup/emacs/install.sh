#!/bin/bash

# Imports
source ${CFGROOT}/setup/setup-functions.sh

# Functions
install_emacs () {
    echo_yellow ">>> Installing emacs ..."
    install_package --cask emacs
}

enable_emacs_daemon () {
    if (is_executable systemctl)
    then
        echo_yellow ">>> Enabling emacs daemon systemd service ..."
        systemctl --user enable emacs.service
    fi
}

# Main
install_emacs
enable_emacs_daemon

exit 0

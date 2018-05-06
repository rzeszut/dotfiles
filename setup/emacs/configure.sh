#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
configure_emacs () {
    echo_yellow '>>> Configuring emacs ...'
    mkdir -p ${HOME}/.emacs.d
    ln -fs ${CFGROOT}/config/emacs/init.el ${HOME}/.emacs.d/init.el
    ln -fs ${CFGROOT}/config/emacs/config ${HOME}/.emacs.d/config
}

# Main
configure_emacs

exit 0


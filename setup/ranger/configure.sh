#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
configure_ranger () {
    echo_yellow '>>> Configuring ranger ...'
    mkdir -p $HOME/.config/ranger
    ln -fs $CFGROOT/config/ranger/rc.conf $HOME/.config/ranger/rc.conf
    ln -fs $CFGROOT/config/ranger/rifle.conf $HOME/.config/ranger/rifle.conf
}

# Main
configure_ranger

exit 0


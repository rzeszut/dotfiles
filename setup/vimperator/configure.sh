#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
configure_vimperator () {
    echo_yellow '>>> Configuring vimperator ...'
    ln -fs $CFGROOT/config/vimperator/vimperatorrc $HOME/.vimperatorrc

    mkdir -p $HOME/.vimperator/colors
    for file in $CFGROOT/config/vimperator/colors/*.vimp; do
        ln -fs $file $HOME/.vimperator/colors/
    done
}

# TODO: install extensions, configure user.js, etc.

# Main
configure_vimperator

exit 0


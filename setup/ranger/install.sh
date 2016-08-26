#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_ranger () {
    echo_yellow ">>> Installing ranger ..."
    sudo apt-get install -y ranger atool w3m highlight mediainfo caca-utils
}

# Main
install_ranger

exit 0


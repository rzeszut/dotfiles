#!/bin/bash

# Imports
source ${CFGROOT}/setup/setup-functions.sh

# Functions
install_pip () {
    echo_yellow ">>> Installing pip ..."
    install_package python3
    install_package python3-pip
}

install_virtualenv () {
    echo_yellow ">>> Installing virtualenv ..."
    sudo pip3 install virtualenv
}

# Main
install_pip
install_virtualenv

exit 0


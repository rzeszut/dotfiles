#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_pip () {
    echo_yellow ">>> Installing pip ..."
    sudo apt-get install -y python-pip python3-pip
}

install_virtualenv () {
    echo_yellow ">>> Installing virtualenv ..."
    sudo pip install virtualenv
}

# Main
install_pip
install_virtualenv

exit 0


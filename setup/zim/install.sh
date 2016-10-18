#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_zim () {
    echo_yellow ">>> Installing zim ..."
    sudo add-apt-repository -y ppa:jaap.karssenberg/zim
    sudo apt-get -y update
    sudo apt-get -y install zim python-gtksourceview2 python-gtkspellcheck
}

# Main
install_zim

exit 0


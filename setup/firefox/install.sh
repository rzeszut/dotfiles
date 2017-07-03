#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_firefox () {
    if [[ $(uname -a) = *Debian* ]]; then
        local appname="iceweasel"
    else
        local appname="firefox"
    fi

    echo_yellow ">>> Installing ${appname} ..."
    sudo apt-get install -y $appname
}

# Main
install_firefox

exit 0


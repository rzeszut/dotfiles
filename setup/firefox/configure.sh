#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Constants
FIREFOX_PATH=${HOME}/.mozilla/firefox

# Functions
configure_vimperator () {
    echo_yellow '>>> Configuring vimperator ...'
    ln -fs ${CFGROOT}/config/firefox/vimperatorrc ${HOME}/.vimperatorrc

    mkdir -p ${HOME}/.vimperator/colors
    for file in ${CFGROOT}/config/firefox/colors/*.vimp; do
        ln -fs $file ${HOME}/.vimperator/colors/
    done
}

install_user_js () {
    local profile=$(cat ${FIREFOX_PATH}/profiles.ini | grep "Path=" | cut -d= -f2)

    echo_yellow ">>> Installing user.js settings ..."
    ln -fs ${CFGROOT}/config/firefox/user.js ${FIREFOX_PATH}/${profile}/user.js
}

# TODO: install extensions

# Main
configure_vimperator
install_user_js

exit 0


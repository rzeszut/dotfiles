#!/bin/bash

DEPENDENCIES_RANGER="ranger atool w3m highlight mediainfo caca-utils"

install_ranger () {
    cat << EOF
Install ranger and additional tools:

    sudo apt-get install $DEPENDENCIES_RANGER

Ranger requires xterm or rxvt to work correctly.
EOF
    read -n1 -r -p 'Press any key to continue...'

    mkdir -p $HOME/.config/ranger

    echo 'Installing ranger config ...'
    ln -fs $CFGROOT/ranger/rc.conf $HOME/.config/ranger/rc.conf
    ln -fs $CFGROOT/ranger/rifle.conf $HOME/.config/ranger/rifle.conf
}

uninstall_ranger () {
    echo 'Uninstalling ranger config ...'
    rm -rf $HOME/.config/ranger
}


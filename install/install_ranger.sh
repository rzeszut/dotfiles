#!/bin/bash

CFGROOT=$(dirname $0)/..
PROGRAM_NAME=$(basename $0)

install_ranger () {
    cat << EOF
Install ranger and additional tools:

    sudo apt-get install ranger atool w3m highlight mediainfo caca-utils

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

case $1 in
    install)
        install_ranger
        ;;

    uninstall)
        uninstall_ranger
        ;;

    *)
        echo "Usage $PROGRAM_NAME (install|uninstall)"
esac


#!/bin/bash

CFGROOT=$(pwd)

cat << EOF
Install ranger and additional tools:

    sudo apt-get install ranger atool w3m highlight mediainfo caca-utils

Ranger requires xterm or rxvt to work correctly.
EOF
read -n1 -r -p 'Press any key to continue...'

mkdir -p $HOME/.config/ranger

echo "Installing ranger ..."
ln -fs $CFGROOT/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -fs $CFGROOT/ranger/rifle.conf $HOME/.config/ranger/rifle.conf


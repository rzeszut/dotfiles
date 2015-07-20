#!/bin/bash

CFGROOT=$(pwd)

cat << EOF
Please install git:

    sudo apt-get install git

Optionally install gitk and git-gui:

    sudo apt-get install gitk git-gui

EOF
read -n1 -r -p 'Press any key to continue...'

echo ''
echo 'Installing gitconfig ...'
ln -fs $CFGROOT/config/gitconfig $HOME/.gitconfig


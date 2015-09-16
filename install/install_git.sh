#!/bin/bash

CFGROOT=$(dirname $0)/..
PROGRAM_NAME=$(basename $0)

install_git () {
    cat << EOF
Please install git:

    sudo apt-get install git

Optionally install gitk and git-gui:

    sudo apt-get install gitk git-gui

EOF
    read -n1 -r -p 'Press any key to continue...'

    echo ''
    echo 'Installing git config ...'
    ln -fs $CFGROOT/config/gitconfig $HOME/.gitconfig
}

uninstall_git () {
	echo 'Uninstalling git config ...'
	unlink $HOME/.gitconfig
}

case $1 in
    install)
        install_git
        ;;

    uninstall)
        uninstall_git
        ;;

    *)
        echo "Usage $PROGRAM_NAME (install|uninstall)"
esac


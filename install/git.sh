#!/bin/bash

DEPENDENCIES_GIT="git gitk git-gui"

install_git () {
    cat << EOF
Please install git:

    sudo apt-get install $DEPENDENCIES_GIT

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


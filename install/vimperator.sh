#!/bin/bash

if [[ $(uname -a) = *Debian* ]]; then
    DEPENDENCIES_VIMPERATOR="iceweasel"
else
    DEPENDENCIES_VIMPERATOR="firefox"
fi

install_vimperator () {
    echo 'Please install Vimperator addon in Firefox.'
    read -n1 -r -p 'Press any key to continue...'

    echo ''
    echo 'Installing vimperator config ...'
    ln -fs $CFGROOT/vimperator/vimperatorrc $HOME/.vimperatorrc

    mkdir -p $HOME/.vimperator/colors
    for file in $CFGROOT/vimperator/colors/*.vimp; do
        ln -fs $file $HOME/.vimperator/colors/
    done
}

uninstall_vimperator () {
    echo 'Uninstalling Vimperator config ...'
    rm -rf $HOME/.vimperator
    unlink $HOME/.vimperatorrc
}


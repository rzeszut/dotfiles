#!/bin/bash

CFGROOT=$(pwd)

echo 'Please install Vimperator addon in Firefox.'
read -n1 -r -p 'Press any key to continue...'

echo ''
echo 'Installing vimperator...'
ln -fs $CFGROOT/vimperator/vimperatorrc $HOME/.vimperatorrc

mkdir -p $HOME/.vimperator/colors
for file in $CFGROOT/vimperator/colors/*.vimp; do
    ln -fs $file $HOME/.vimperator/colors/
done


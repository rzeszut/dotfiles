#!/bin/bash

CFGROOT=$(pwd)

echo "Installing vim ..."
ln -fs ${CFGROOT}/vimrc ${HOME}/.vimrc

echo "Installing Vundle..."
mkdir -p ${HOME}/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Downloading plugins..."
vim +BundleClean! +BundleInstall! +qall

echo "Compiling YCM ..."
cd ${HOME}/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

echo "Installing tern ..."
cd ${HOME}/.vim/bundle/tern_for_vim
if [ -e /usr/local/bin/npm ]; then
    npm install
fi

cd ${CFGROOT}

#!/bin/bash

CFGROOT=$(pwd)

echo "Installing vim ..."
ln -fs ${CFGROOT}/vim/vimrc ${HOME}/.vimrc

echo "Installing Vundle ..."
mkdir -p ${HOME}/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Downloading plugins ..."
vim +BundleClean! +BundleInstall! +qall

echo "Compiling YCM ..."
cd ${HOME}/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

if [[ ! -z `command -v npm` ]]; then
    echo "Installing tern ..."
    cd ${HOME}/.vim/bundle/tern_for_vim
    npm install
fi

cd ${CFGROOT}

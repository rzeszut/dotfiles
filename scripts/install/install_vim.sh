#!/bin/bash

CFGROOT=$(pwd)

is_executable () {
    [[ ! -z  `command -v $1` ]] && return 0 || return 1
}

echo "Installing vim ..."
ln -fs $CFGROOT/vim/vimrc $HOME/.vimrc

echo "Installing Vundle ..."
mkdir -p $HOME/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo "Downloading plugins ..."
vim +PluginClean! +PluginInstall! +qall

echo "Compiling YCM ..."
cd $HOME/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
ln -fs $CFGROOT/vim/ycm_extra_conf.py $HOME/.ycm_extra_conf.py

if ( is_executable npm ); then
    echo "Installing tern ..."
    cd $HOME/.vim/bundle/tern_for_vim
    npm install
fi


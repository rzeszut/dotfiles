#!/bin/bash

CFGROOT=$(pwd)

# 0 is True, 1 is False -- 0 is a normal return code
is_executable () {
    [[ ! -z `command -v $1` ]] && return 0 || return 1
}
is_not_executable () {
    [[ -z `command -v $1` ]] && return 0 || return 1
}

if (is_not_executable vim || is_not_executable git); then
    echo "ERROR: You must have both vim and git installed."
    exit 1
fi

echo "Installing vim configuration ..."
ln -fs $CFGROOT/vim/vimrc $HOME/.vimrc

echo "Installing Vundle ..."
mkdir -p $HOME/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo "Downloading plugins ..."
vim +PluginClean! +PluginInstall! +qall

if [[ -d $HOME/.vim/bundle/YouCompleteMe ]]; then
    echo "Compiling YCM ..."
    cd $HOME/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer
    ln -fs $CFGROOT/vim/ycm_extra_conf.py $HOME/.ycm_extra_conf.py
fi

if (is_executable cabal && is_executable happy); then
    echo "Installing ghc-mod and haskell extensions..."
    cabal update
    cabal install ghc-mod
    cd $HOME/.vim/bundle/vimproc.vim
    make
fi

if (is_executable npm); then
    echo "Installing tern ..."
    cd $HOME/.vim/bundle/tern_for_vim
    npm install
fi


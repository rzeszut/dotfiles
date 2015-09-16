#!/bin/bash

CFGROOT=$(dirname $0)/..
PROGRAM_NAME=$(basename $0)

source $CFGROOT/shell/shell-functions.sh

print_install_message () {
    cat << EOF
This installation requires git. Make sure to run 'make git' beforehand.
Please install vim 7.4:

    sudo apt-get install vim-gtk exuberant-ctags

Install libraries required by YCM:

    sudo apt-get install build-essential cmake python-dev

Optionally install mupdf and rubber for editing LaTeX files:

    sudo apt-get install mupdf rubber

Optionally install cabal and happy for Haskell support via ghc-mod:

    sudo apt-get install cabal-install happy

Optionally install jshint:

    sudo npm install -g jshint

EOF
    read -n1 -r -p 'Press any key to continue...'
}

check_vim_installation () {
    if (is_not_executable vim || is_not_executable git); then
        echo 'ERROR: You must have both vim and git installed.'
        exit 1
    fi
}

install_config () {
    echo 'Installing Xmodmap ...'
    ln -fs $CFGROOT/vim/xmodmap ${HOME}/.Xmodmap

    echo 'Installing ctags ...'
    ln -fs $CFGROOT/vim/ctags ${HOME}/.ctags

    echo 'Installing vim configuration ...'
    ln -fs $CFGROOT/vim/vimrc $HOME/.vimrc
}

install_plugins () {
    echo 'Installing Vundle ...'
    mkdir -p $HOME/.vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/vundle

    echo 'Downloading plugins ...'
    vim +PluginClean! +PluginInstall! +qall
}

install_ycm () {
    if [[ -d $HOME/.vim/bundle/YouCompleteMe ]]; then
        echo 'Compiling YCM ...'
        cd $HOME/.vim/bundle/YouCompleteMe
        ./install.sh --clang-completer
        ln -fs $CFGROOT/vim/ycm_extra_conf.py $HOME/.ycm_extra_conf.py
    fi
}

install_haskell_ext () {
    if (is_executable cabal && is_executable happy); then
        echo 'Installing ghc-mod and haskell extensions ...'
        cabal update
        cabal install ghc-mod
        cd $HOME/.vim/bundle/vimproc.vim
        make
    fi
}

install_tern_js () {
    if (is_executable npm); then
        echo 'Installing tern-js ...'
        cd $HOME/.vim/bundle/tern_for_vim
        npm install
    fi
}

uninstall_vim () {
    echo 'Uninstalling Vim config ...'
    rm -rf $HOME/.vim
    unlink $HOME/.vimrc
    unlink $HOME/.Xmodmap
    unlink $HOME/.ctags
    unlink $HOME/.ycm_extra_conf.py
}

case $1 in
    install)
        print_install_message
        check_vim_installation
        install_config
        install_plugins
        install_ycm
        install_haskell_ext
        install_tern_js
        ;;

    uninstall)
        uninstall_vim
        ;;

    *)
        echo "Usage $PROGRAM_NAME (install|uninstall)"
esac


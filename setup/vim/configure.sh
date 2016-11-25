#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
configure_vim () {
    echo_yellow '>>> Configuring Xmodmap ...'
    ln -fs $CFGROOT/config/vim/xmodmap ${HOME}/.Xmodmap

    echo_yellow '>>> Configuring ctags ...'
    ln -fs $CFGROOT/config/vim/ctags ${HOME}/.ctags

    echo_yellow '>>> Configuring vim ...'
    ln -fs $CFGROOT/config/vim/vimrc $HOME/.vimrc
}

download_plugins () {
    echo_yellow '>>> Installing Vundle ...'
    mkdir -p $HOME/.vim/bundle
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/vundle

    echo_yellow '>>> Downloading plugins ...'
    vim +PluginClean! +PluginInstall! +qall
}

compile_ycm () {
    if [[ -d $HOME/.vim/bundle/YouCompleteMe ]]; then
        echo_yellow '>>> Compiling YCM ...'
        cd $HOME/.vim/bundle/YouCompleteMe
        ./install.py --clang-completer
        ln -fs $CFGROOT/config/vim/ycm_extra_conf.py $HOME/.ycm_extra_conf.py
    fi
}

# Main
configure_vim

prompt ">>> Do you want to download vim plugins?" font_yellow font_normal &&\
    download_plugins

prompt ">>> Do you want to compile YouCompleteMe?" font_yellow font_normal &&\
    compile_ycm

exit 0


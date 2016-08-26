#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_vim () {
    echo_yellow ">>> Installing vim ..."
    sudo apt-get install -y vim exuberant-ctags build-essential cmake python-dev
}

install_vim_gui () {
    echo_yellow ">>> Installing vim GUI ..."
    sudo apt-get install -y vim-gtk
}

# Main
install_vim

font_yellow &&\
    prompt ">>> Do you want to install vim GUI frontend?" &&\
    font_normal &&\
    install_vim_gui

exit 0


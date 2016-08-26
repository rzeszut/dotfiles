#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
install_i3 () {
    echo_yellow '>>> Installing i3 ...'
    sudo apt-get install -y i3-wm i3status i3lock\
        rxvt-unicode suckless-tools xfonts-terminus xbacklight feh
}

install_dunst () {
    echo_yellow '>>> Installing dunst ...'
    sudo apt-get install -y dunst
}

# Main
install_i3

font_yellow &&\
    prompt '>>> Do you want to install dunst (notification manager)?' &&\
    font_normal &&\
    install_dunst

exit 0


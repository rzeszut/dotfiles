#!/bin/bash

# Imports
source ${CFGROOT}/config/shell/shell-functions.sh

# Functions
configure_i3 () {
    echo_yellow '>>> Configuring .Xresources ...'
    ln -fs $CFGROOT/config/i3-wm/xresources $HOME/.Xresources

    echo_yellow '>>> Configuring i3 ...'
    mkdir -p $HOME/.i3
    ln -fs $CFGROOT/config/i3-wm/config $HOME/.i3/config
    ln -fs $CFGROOT/config/i3-wm/autostart $HOME/.i3/autostart
    ln -fs $CFGROOT/config/i3-wm/status $HOME/.i3status.conf

    echo_yellow '>>> Configuring dunst ...'
    mkdir -p $HOME/.config/dunst
    ln -fs $CFGROOT/config/i3-wm/dunstrc $HOME/.config/dunst/dunstrc
}

# Main
configure_i3

exit 0


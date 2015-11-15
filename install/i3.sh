#!/bin/bash

DEPENDENCIES_I3="i3-wm i3status rxvt-unicode suckless-tools i3lock dunst xfonts-terminus xbacklight feh"

install_i3 () {
    cat << EOF
Please install i3 and additional applications:

    sudo apt-get install $DEPENDENCIES_I3

EOF
    read -n1 -r -p 'Press any key to continue...'

    echo ''
    echo 'Installing .Xresources ...'
    ln -fs $CFGROOT/i3-wm/xresources $HOME/.Xresources

    echo 'Installing i3 config ...'
    mkdir -p $HOME/.i3
    ln -fs $CFGROOT/i3-wm/config $HOME/.i3/config
    ln -fs $CFGROOT/i3-wm/autostart $HOME/.i3/autostart
    ln -fs $CFGROOT/i3-wm/status $HOME/.i3status.conf

    echo 'Installing dunst config ...'
    mkdir -p $HOME/.config/dunst
    ln -fs $CFGROOT/i3-wm/dunstrc $HOME/.config/dunst/dunstrc
}

uninstall_i3 () {
    echo 'Uninstalling i3 config ...'
    unlink $HOME/.Xresources
    rm -rf $HOME/.i3
    unlink $HOME/.i3status.conf
    rm -rf $HOME/.config/dunst
}


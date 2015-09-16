#!/bin/bash

CFGROOT=$(dirname)/..
PROGRAM_NAME=$(basename $0)

install_i3 () {
    cat << EOF
Please install i3 and required applications:

    sudo apt-get install i3-wm i3status rxvt-unicode suckless-tools i3lock dunst

Install some nice fonts for dmenu:

    sudo apt-get install xfonts-terminus

Install additional applications:

    sudo apt-get install xbacklight feh

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

case $1 in
    install)
        install_i3
        ;;

    uninstall)
        uninstall_i3
        ;;

    *)
        echo "Usage $PROGRAM_NAME (install|uninstall)"
esac


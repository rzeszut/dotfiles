#!/bin/bash

CFGROOT=$(pwd)

cat << EOF
Please install i3 and required applications:

    sudo apt-get install i3-wm i3status rxvt-unicode suckless-tools

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
ln -fs $CFGROOT/i3-wm/status $HOME/.i3status.conf
ln -fs $CFGROOT/i3-wm/xsession $HOME/.xsession


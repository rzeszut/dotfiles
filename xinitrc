#!/bin/bash
 
# run dbus - not needed as for now
#eval `dbus-launch --auto-syntax`

# Load resources
xrdb -merge .Xresources
 
# Set the background color
feh --bg-scale /home/mateusz/Obrazy/cherry-blossom.jpg
 
## Fire up apps
# xcompmgr
if [ -x /usr/bin/xcompmgr ] ; then
    xcompmgr -n -r 0 &
fi

# mpd
MPD_RUNNING=`ps -e | grep mpd`
if [ -x /usr/bin/mpd -a -z "$MPD_RUNNING" ] ; then
    mpd
fi

# xscreensaver
if [ -x /usr/bin/xscreensaver ] ; then 
    xscreensaver -no-splash &
fi

# urxvt daemon
urxvtd -q -o -f

# network manager
if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

# sound applet
if [ -x /usr/bin/gnome-sound-applet ] ; then
    gnome-sound-applet &
fi

# xflux - Kraków coordinates
if [ -x /usr/bin/xflux ] ; then
    killall xflux
    xflux -l 50.0614 -g 19.9372 &
fi
 
# dropbox
if [ -x /usr/bin/dropbox ] ; then 
    dropbox start &
fi

# thunar, file manager; automounting
if [ -x /usr/bin/thunar ] ; then
    thunar --daemon &
fi

# ibus daemon - for japanese input
if [ -x /usr/bin/ibus-daemon ] ; then
    ibus-daemon --xim -r &
fi

# emacs daemon mode
emacs --daemon &

# run xmonad 
exec xmonad


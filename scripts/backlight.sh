#!/bin/bash

if ( is_not_executable xbacklight ); then
    echo "This script requires xbacklight to work."
    exit 1
fi

HOSTNAME=$(hostname)
if [[ $HOSTNAME == *netbook* ]]; then
    # Intel graphics card on netbook can only change its brightness by ~15%
    BACKLIGHT_STEP_UP=15
    BACKLIGHT_STEP_DOWN=10
else
    BACKLIGHT_STEP_UP=3
    BACKLIGHT_STEP_DOWN=3
fi

case $1 in
    up)
        xbacklight + $BACKLIGHT_STEP_UP
        ;;

    down)
        xbacklight - $BACKLIGHT_STEP_DOWN
        ;;

    *)
        echo "Usage: $(basename $0) (up|down)"
esac


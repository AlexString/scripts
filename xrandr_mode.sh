#!/bin/bash

# Author: https://github.com/bdelphin
# Repository: https://github.com/bdelphin/scripts/blob/master/xrandr_mode.sh

if [ "$#" -ne 1 ]; then
    echo "Please provide the mode to switch to. Candidates are : extended1080 normal"
    exit
fi

if [ "$1" == "extended1080" ]; then
#    xrandr --dpi 200 --fb 7680x2160 --output eDP1 --mode 3840x2160 --output HDMI1 --mode 1920x1080 --scale 2x2 --pos 3840x0
    xrandr --dpi 200 --output eDP1 --auto --output HDMI1 --right-of eDP1 --mode 1920x1080 --scale 2x2
    echo "xrandr switching to extended1080 mode ..."
fi

if [ "$1" == "extended_4k" ]; then
    xrandr --dpi 200 --output eDP1 --auto --output HDMI1 --right-of eDP1 --auto
    echo "xrandr switching to extended1080 mode ..."
fi

if [ "$1" == "normal" ]; then
    xrandr --output HDMI1 --off
    xrandr --dpi 200 --output eDP1 --auto
    #polybar hdmi &
    echo "xrandr switching to normal mode ..."
fi

exec $HOME/.config/polybar/launch.sh


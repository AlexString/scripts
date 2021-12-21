#!/bin/bash

# Author: AlexString
# Description: This script handles HDMI multiple screen in 4 ways: normal_mode, hdmi_mode, hdmi_only, mirrored

switch_individual_displays(){
    local screen_off=$1
    local screen_on=$2 

    xrandr --output $screen_off --off
    xrandr --dpi 200 --output $screen_on --auto
}

turn_on_hdmi(){
    local hdmi_screen=$1
    local intern_screen=$2

    xrandr --output $intern_screen --auto --output $hdmi_screen --right-of $intern_screen --auto
}

show_options(){
    echo "Available modes:"
    echo -e "1)normal_mode\n2)hdmi_mode\n3)hdmi_only\n4)mirrored"
}

ask_option(){
    echo -n "choose a mode (#): "
    read
    return ${REPLY}
}

# Change this according to your monitors
readonly INTERN_MONITOR="eDP-1"
readonly EXTERN_MONITOR="HDMI-1"
#
MODE=$1

if [ "$#" -eq 0 ]; then
    show_options
    MODE=$(ask_option)
fi

case $MODE in 
    1|"normal_mode")
        echo "xrandr switching to normal mode ..."
        switch_individual_displays $EXTERN_MONITOR $INTERN_MONITOR
    ;;
    2|"hdmi_mode")
        echo "xrandr switching to hdmi_mode ..."
        turn_on_hdmi $EXTERN_MONITOR $INTERN_MONITOR
    ;;
    3|"hdmi_only")
        echo "xrandr switching to hdmi_only mode ..."
        switch_individual_displays $INTERN_MONITOR $EXTERN_MONITOR
    ;;
    4|"mirrored")
        echo "xrandr mirrored mode ..."
        #TODO
    ;;
    *) exit 0 ;;
esac

#echo "launching polybar"
#sleep 3
#exec ~/.config/polybar/launch.sh

echo "done"

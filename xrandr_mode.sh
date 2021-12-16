#!/bin/bash

# Author: AlexString
# Description: This script handles HDMI multiple screen in 3 ways: normal_mode, hdmi_mode, hdmi_only

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

readonly INTERN_MONITOR="eDP-1"
readonly EXTERN_MONITOR="HDMI-1"
readonly MODE=$1

case $MODE in 
    "normal_mode")
        echo "xrandr switching to normal mode ..."
        switch_individual_displays $EXTERN_MONITOR $INTERN_MONITOR
    ;;
    "hdmi_mode")
        echo "xrandr switching to extend_hdmi mode ..."
        turn_on_hdmi $EXTERN_MONITOR $INTERN_MONITOR
    ;;
    "hdmi_only")
        echo "xrandr switching to hdmi_only mode ..."
        switch_individual_displays $INTERN_MONITOR $EXTERN_MONITOR
    ;;
    *)
        echo "Modes available:"
        echo -e "normal_mode\nhdmi_mode\nhdmi_only"
        exit 0
    ;;
esac

echo "launching polybar"
sleep 3
exec ~/.config/polybar/launch.sh
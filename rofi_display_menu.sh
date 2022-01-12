#!/usr/bin/env bash

# Use rofi to call a script to configure monitor displaying

OPTIONS="Normal mode\nHDMI_mode\nHDMI_only\nMirrored"

LAUNCHER="rofi -dmenu -i -p rofi-display:"
SCRIPT=" "

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      Normal)
        ~/scripts/xrandr_mode.sh normal_mode
	    ;;
      HDMI_mode)
        ~/scripts/xrandr_mode.sh hdmi_mode
      ;;
      HDMI_only)
        ~/scripts/xrandr_mode.sh hdmi_only
      ;;
      Mirrored)
        ~/scripts/xrandr_mode.sh mirrored
      ;;
      *)
      ;;
    esac
fi

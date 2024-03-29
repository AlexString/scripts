#!/usr/bin/env bash

# This is a fork from a fork.
# bdelphin's rofi-power fork
# Use rofi to call systemctl for shutdown, reboot, etc

# This script was forked from Oliver Kraitschy's rofi-power - http://okraits.de

OPTIONS="Reboot system\nPower-off system\nSuspend system\nHibernate system\nLock system\nExit window manager"

LAUNCHER="rofi -dmenu -i -p rofi-power:"
#USE_LOCKER="false"
#LOCKER="$HOME/scripts/lockscript/lock -n"

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      Reboot)
        systemctl reboot
        ;;
      Power-off)
        systemctl poweroff
        ;;
      Suspend)
        systemctl suspend
        #$($USE_LOCKER) && "$LOCKER"; systemctl hibernate
        ;;
      Hibernate)
        systemctl hibernate
        #$($USE_LOCKER) && "$LOCKER"; systemctl hibernate
        ;;
      Lock)
        dm-tool lock
	    ;;
      Exit)
        i3-msg exit
        ;;
      *)
        ;;
    esac
fi

#!/bin/sh
ACTION=`zenity --width=90 --height=255 --list --radiolist --text="Choose" --title="Logout" --column "Choice" --column "Action" TRUE Exit FALSE Reboot FALSE Suspend FALSE Hibernate FALSE Lock FALSE Disconnect`
if [ -n "${ACTION}" ];then
case $ACTION in
  Exit)
    dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop
    ;;
  Restart)
    dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart
    ;;
  Lock)
    xlock -mousemotion +description -mode blank -bg black -fg grey30
    ;;
  Suspend)
   dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend
   ;;
  Hibernate)
   dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Hibernate
   ;;
  Logout)
   echo "openbox --exit"
   ;;
  esac
fi

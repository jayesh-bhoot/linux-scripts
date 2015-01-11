yad   --width 300 \
      --title "System Logout" \
		--button="Lock Screen:1" \
		--button="Logout:2" \
		--button="Suspend:3" \
      --button="Hibernate:4" \
		--button="Reboot:5" \
		--button="Shutdown:6"

selectedAction=$?

case $selectedAction in
   1)
   xlock -mousemotion +description -mode blank -bg black -fg grey30
   ;;

   2)
   openbox --exit
   ;;

   3)
   xlock -mousemotion +description -mode blank -bg black -fg grey30
   dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend
   ;;

   4)
   xlock -mousemotion +description -mode blank -bg black -fg grey30
   dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Hibernate
   ;;

   5)
   dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart
   ;;

   6)
   dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop
   ;;
esac

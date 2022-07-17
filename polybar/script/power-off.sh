#!/bin/sh

CHOSE=$(echo -e " Logout\n Shutdown\n Reboot" | dmenu -i -m 1 -x 1800 -y 38 -z 120)

if [[ "$CHOSE" == " Logout" ]]; then
    killall -9 dwm
elif [[ "$CHOSE" == " Shutdown" ]]; then
    shutdown -h now
elif [[ "$CHOSE" == " Reboot" ]]; then
    reboot
else
    echo ""
fi

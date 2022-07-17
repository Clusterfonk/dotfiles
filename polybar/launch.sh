#!/usr/bin/sh

# Terminate already running bar instances
killall -q polybar

# wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# launch polybar
polybar -r -c $XDG_CONFIG_HOME/polybar/config.ini ws_primary &
polybar -r -c $XDG_CONFIG_HOME/polybar/config.ini ws_secondary &
polybar -r -c $XDG_CONFIG_HOME/polybar/config.ini music &
polybar -r -c $XDG_CONFIG_HOME/polybar/config.ini tray &

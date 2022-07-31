#!/bin/sh
[[ -f $XDG_CONFIG_HOME/X11/Xresources ]] && xrdb -merge $XDG_CONFIG_HOME/X11/Xresources

# Start WM
exec /usr/bin/awesome >> $XDG_CACHE_HOME/awesome/stdout 2>> $XDG_CACHE_HOME/awesome/stderr


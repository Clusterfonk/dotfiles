#!/bin/sh
[[ -f $XDG_CONFIG_HOME/X11/Xresources ]] && xrdb -merge $XDG_CONFIG_HOME/X11/Xresources

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# Start WM
exec /usr/bin/awesome >> $XDG_CACHE_HOME/awesome/stdout 2>> $XDG_CACHE_HOME/awesome/stderr


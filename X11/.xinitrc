#!/bin/sh
[[ -f $XDG_CONFIG_HOME/X11/Xresources ]] && xrdb -merge $XDG_CONFIG_HOME/X11/Xresources

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# Start WM
exec /usr/bin/awesome >> /dev/null 2>&1

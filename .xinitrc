#!/bin/sh
[[ -f $XDG_CONFIG_HOME/X11/Xresources ]] && xrdb -load $XDG_CONFIG_HOME/X11/Xresources

~/.config/feh/.fehbg &

# Start WM
while type awesome >/dev/null; do awesome && continue || break; done

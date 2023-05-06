#!/bin/sh

case $1 in
    *mkv|*webm|*mp4|*youtube.com/watch*|*yewtu.be*)
        if ! pidof -x "mpv" >/dev/null; then
            setsid -f mpv -quiet $1 >/dev/null 2>&1
        fi;;
#    *png|*jpg|*jpe|*jpeg|*gif)
#        		curl -sL "$url" > "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" && sxiv -a "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")"  >/dev/null 2>&1 & ;;
#    *pdf|*cbz|*cbr)
#		curl -sL "$url" > "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")" && zathura "/tmp/$(echo "$url" | sed "s/.*\///;s/%20/ /g")"  >/dev/null 2>&1 & ;;
    *)
		[ -f $1 ] && setsid -f "$TERMINAL" -e "$EDITOR" $1 >/dev/null 2>&1 || setsid -f "$BROWSER" $1 >/dev/null 2>&1
esac

#!/bin/sh

status() {
    STATUS=$(awk -F"[][]" '/Left:/ { print $4"-"$2 }' <(amixer sget Capture))

    if [ "${STATUS%-*}" = "off" ]; then
        echo "%{F#fb4934}%{F-} off"
    else
        VOLUME=${STATUS#*-}
        printf " %4s\n" ${VOLUME}
    fi
}

listen() {
    status

    LANG=EN; pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "source" || echo "$event" | grep -q "server"; then
            status
        fi
    done
}

toggle() {
    amixer -q sset Capture toggle
}

increase() {
    VOLUME=$(awk -F"[][]" '/Left:/ { print $2 + 5 }' <(amixer sget Capture))
    amixer -q set Capture $VOLUME%
}

decrease() {
    VOLUME=$(awk -F"[][]" '/Left:/ { print $2 - 5 }' <(amixer sget Capture))

    if [ $VOLUME -lt 5 ]; then
        amixer -q set Capture 0%
    else
        amixer -q set Capture $VOLUME%
    fi

}

case "$1" in
    --toggle)
        toggle
        ;;
    --increase)
        increase
        ;;
    --decrease)
        decrease
        ;;
    *)
        listen
        ;;
esac

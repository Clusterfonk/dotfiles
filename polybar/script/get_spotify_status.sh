#!/bin/bash

# The name of polybar bar which houses the main spotify module and the control modules.
PARENT_BAR="now-playing"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

# Set the source audio player here.
# Players supporting the MPRIS spec are supported.
# Examples: spotify, vlc, chrome, mpv and others.
# Use `playerctld` to always detect the latest player.
# See more here: https://github.com/altdesktop/playerctl/#selecting-players-to-control
PLAYER="spotify"

# Format of the information displayed
# See more attributes here: https://github.com/altdesktop/playerctl/#printing-properties-and-metadata
TITLE_FORMAT="{{trunc(title, 22)}}"
ARTIST_FORMAT="{{trunc(artist, 22)}}"

# Sends $2 as message to all polybar PIDs that are part of $1
update_hooks() {
    while IFS= read -r id
    do
        polybar-msg -p "$id" hook spotify-play-pause $2 1>/dev/null 2>&1
    done < <(echo "$1")
}

PLAYERCTL_STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    STATUS=$PLAYERCTL_STATUS
else
    STATUS="No player is running"
fi

if [ "$1" == "--status" ]; then
    echo $STATUS
else
    if [ "$STATUS" = "Stopped" ]; then
        printf "No music is playing"
    elif [ "$STATUS" = "Paused"  ]; then
        update_hooks "$PARENT_BAR_PID" 2
        TITLE=$(playerctl --player=$PLAYER metadata --format "$TITLE_FORMAT")
        ARTIST=$(playerctl --player=$PLAYER metadata --format "$ARTIST_FORMAT")
        printf "%s %%{F#fabd2f}%%{F-} %s\n" "${TITLE}" "${ARTIST}"
    elif [ "$STATUS" = "No player is running"  ]; then
        printf "$STATUS"
    else
        update_hooks "$PARENT_BAR_PID" 1
        declare TITLE=$(playerctl --player=$PLAYER metadata --format "$TITLE_FORMAT")
        declare ARTIST=$(playerctl --player=$PLAYER metadata --format "$ARTIST_FORMAT")
        printf "%s - %s\n" "${TITLE}" "${ARTIST}"
    fi
fi


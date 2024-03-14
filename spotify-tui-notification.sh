#!/bin/bash

# Define your player's name
player=$(dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep org.mpris.MediaPlayer2.spot | awk -F '"' '{print $2}')

# Fetch the metadata for the currently playing song
metadata=$(dbus-send --print-reply --session --dest=$player /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:"org.mpris.MediaPlayer2.Player" string:"Metadata")

# Extract title, artist, and album from the metadata
title=$(echo "$metadata" | grep -A1 "xesam:title" | sed -n '2p' | sed 's/.*string "\(.*\)"/\1/')
album=$(echo "$metadata" | grep -A1 "xesam:album" | sed -n '2p' | sed 's/.*string "\(.*\)"/\1/')
artist=$(echo "$metadata" | awk '/xesam:artist/{flag=1; next} /]/{flag=0} flag && /string/{gsub(/.*string "/, "", $0); gsub(/"$/, "", $0); printf "%s, ", $0}' | sed 's/, $//')
# Send the notification with the song information
if [[ -n "$title" || -n "$artist" || -n "$album" ]]; then
    notify-send -t 3000 "Now Playing" "Title: $title\nArtist: $artist\nAlbum: $album"
fi


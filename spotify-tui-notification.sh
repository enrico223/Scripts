#!/bin/sh 
song=$(playerctl metadata --format "Title: {{title }}\n Artist: {{ artist }}\n Album {{ album }}")
if [[ $(playerctl -l) =~ ^spotifyd* ]]; then
	notify-send -t 3000 "Spotify" "$song"
elif [[ $(playerctl -l) =~ ^mpd* ]]; then
	notify-send -t 3000 "MPD" "$song"
fi

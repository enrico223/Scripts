#!/bin/sh 
song=$(playerctl metadata --format "Title: {{title }}\nArtist: {{ artist }}\nAlbum: {{ album }}")
if [[ $(playerctl -l) =~ ^spotifyd* ]]; then
	notify-send -t 3000 "Music" "$song"
elif [[ $(playerctl -l) =~ ^mpd* ]]; then
	notify-send -t 3000 "Music" "$song"
elif [[ $(playerctl -l) =~ ^rhythmbox* ]]; then
	notify-send -t 3000 "Music" "$song"
fi

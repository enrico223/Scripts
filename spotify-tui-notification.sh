#!/bin/sh 
song=$(playerctl metadata --format "Title: {{title }}\nArtist: {{ artist }}\nAlbum: {{ album }}")
if [[ $(playerctl -l) =~ ^(spotifyd|mpd*) ]]; then
	notify-send -t 3000 "Music" "$song"
fi



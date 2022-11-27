#!/bin/sh 
song=$(playerctl metadata --format "Title: {{title }}\nArtist: {{ artist }}\nAlbum {{ album }}")
notify-send -t 3000 "Spotify" "$song"

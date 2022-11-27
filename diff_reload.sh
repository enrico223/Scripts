#!/bin/bash

if [ ! $(diff -q /home/enrico/.config/waybar/config /home/enrico/.config/waybar/config)]; then
		killall waybar 
		waybar 
fi


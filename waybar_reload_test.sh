#!/usr/bin/env bash

WAYBAR_DIRECTORY = /home/enrico/.config/waybar/

list_creation() {
	for i in `ls WAYBAR_DIRECTORY` 
} 

check_last_update() {
	if [ -e `stat -c %Y` ]; then
		w

#!/bin/bash

# Config
monitor="DP-1"
monitor2="DP-2"
hdmi="HDMI-A-1"
laptop="eDP-1"
wallpaper_dir="$HOME/Pictures/Wallpapers"
time_stamp_file="$HOME/.last_hyprpaper_run"
hyprpaper_conf="$HOME/.config/hypr/hyprpaper.conf"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get list of wallpaper file paths
file_listing=($wallpaper_dir/*)

function hyprpaper_set_main() {
    # Get one random file path
    file_random=("${file_listing[RANDOM % ${#file_listing[@]}]}")
	hyprpaper reload "$laptop, /home/enrico/Pictures/Wallpapers/cherry.webp"
}

function hyprpaper_set_secondary() {
    # Set wallpaper with hyprctl
    file_random=("${file_listing[RANDOM % ${#file_listing[@]}]}")
	sleep 2
	if [[ $(hyprctl monitors | awk '/Monitor/ {print $2}') == $monitor ]]; then
		hyprctl hyprpaper reload "$monitor,$file_random"
	elif [[ $(hyprctl monitors | awk '/Monitor/ {print $2}') == $monitor2 ]]; then
		hyprctl hyprpaper reload "$monitor2,$file_random"
	elif [[ $(hyprctl monitors | awk '/Monitor/ {print $2}') == $laptop ]]; then
		hyprctl hyprpaper reload "$laptop,$file_random"
	elif [[ $(hyprctl monitors | awk '/Monitor/ {print $2}') == $hdmi ]]; then
		hyprctl hyprpaper reload "$hdmi,$file_random"
	else
		notify-send "Something wrong happened"
		exit 1
	fi
}

function swaybg_set {
    file_random=("${file_listing[RANDOM % ${#file_listing[@]}]}")
	if pgrep swaybg; then
		pkill -9 swaybg
		swaybg --image $file_random
		if [ $file_random -eq "io_e_lei.jpg"]; then
				swaybg --image $file_random --mode center
		fi
	else 
		swaybg --image $file_random
	fi
}

function update_hyprpaperconf {
	sed -i '/preload/d' $hyprpaper_conf
	for x in $(ls $wallpaper_dir);
	do
		echo preload = $wallpaper_dir/$x >> $hyprpaper_conf
	done
}

update_hyprpaperconf

# Check if the script was run less than a second ago
if [ -f "$time_stamp_file" ]; then
    last_run=$(cat "$time_stamp_file")
    current_time=$(date +%s)
    time_diff=$((current_time - last_run))

    if [ "$time_diff" -lt "1" ]; then
        echo "Please wait a second before running the script again."
        exit 1
    fi
fi

# Save the current timestamp
date +%s > "$time_stamp_file"
# Call the function
if [ $DESKTOP_SESSION == hyprland ]; then
	hyprpaper_set_secondary
elif [ $DESKTOP_SESSION == sway ]; then
	swaybg_set
elif [ $DESKTOP_SESSION == plasma ]; then
	file_random=("${file_listing[RANDOM % ${#file_listing[@]}]}")
	plasma-apply-wallpaperimage $file_random
else 
	notify-send "Not a compatible desktop"
	exit 1
fi

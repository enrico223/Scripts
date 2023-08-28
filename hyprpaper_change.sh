#!/bin/bash

# Config
monitor="DP-2"
wallpaper_dir="$HOME/Pictures/Wallpapers"
time_stamp_file="$HOME/.last_hyprpaper_run"

# Get list of wallpaper file paths
file_listing=($wallpaper_dir/*)

function hyprpaper_set() {
    # Get one random file path
    file_random=("${file_listing[RANDOM % ${#file_listing[@]}]}")

    # Set wallpaper with hyprctl
    hyprctl hyprpaper wallpaper "$monitor,$file_random"
}

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
hyprpaper_set

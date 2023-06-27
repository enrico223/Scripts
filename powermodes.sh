#!/bin/bash

# Define the available power profiles
profiles=("power-saver" "balanced" "performance")

# Prompt the user to select a power profile
selected_profile=$(printf '%s\n' "${profiles[@]}" | wofi --conf=$HOME/.config/wofi/config.power --style=$HOME/.config/wofi/style.widgets.css)

# Set the selected power profile
case $selected_profile in
    "Power-saver")
        powerprofilesctl set powersaver
        ;;
    "Balanced")
        powerprofilesctl set balanced
        ;;
    "Performance")
        powerprofilesctl set performance
        ;;
esac


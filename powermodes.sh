#!/bin/bash

# Define the available power profiles
profiles=("Power-saver" "Balanced" "Performance")

# Prompt the user to select a power profile
selected_profile=$(printf '%s\n' "${profiles[@]}" | wofi --conf=$HOME/.config/wofi/config.power --style=$HOME/.config/wofi/style.widgets.css)

# Set the selected power profile
case $selected_profile in
    "Power-saver")
        powerprofilesctl set power-saver
        ;;
    "Balanced")
        powerprofilesctl set balanced
        ;;
    "Performance")
        powerprofilesctl set performance
        ;;
esac


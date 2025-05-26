#!/bin/bash

# === Configuration ===
monitor_primary="DP-1"
monitor_secondary="DP-2"
monitor_hdmi="HDMI-A-1"
monitor_laptop="eDP-1"

wallpaper_dir="$HOME/Pictures/Wallpapers"
hyprpaper_conf="$HOME/.config/hypr/hyprpaper.conf"

# Get a random wallpaper from the directory
get_random_wallpaper() {
    shopt -s nullglob
    files=("$wallpaper_dir"/*)
    echo "${files[RANDOM % ${#files[@]}]}"
}

# --- Hyprland ---
set_wallpaper_hypr() {
    local file
    file=$(get_random_wallpaper)

    for monitor in $(hyprctl monitors | awk '/Monitor/ {print $2}'); do
        hyprctl hyprpaper wallpaper "$monitor,$file"
    done
}

# --- Sway ---
set_wallpaper_sway() {
    local file
    file=$(get_random_wallpaper)

    # Get all outputs and apply the same wallpaper
    for output in $(swaymsg -t get_outputs | jq -r '.[].name'); do
        swaymsg output "$output" bg "$file" fill
    done
}

# --- KDE Plasma ---
set_wallpaper_kde() {
    local file
    file=$(get_random_wallpaper)

    # Use qdbus to set the wallpaper for all desktops
    for screen in $(qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
        var screens = desktops(); var ids = [];
        for (var i = 0; i < screens.length; i++) {
            ids.push(screens[i].screen);
        }
        ids.join(',');
    "); do
        qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
            var allDesktops = desktops();
            for (var i = 0; i < allDesktops.length; i++) {
                d = allDesktops[i];
                d.wallpaperPlugin = 'org.kde.image';
                d.currentConfigGroup = ['Wallpaper', 'org.kde.image', 'General'];
                d.writeConfig('Image', 'file://$file');
            }
        "
    done
}

# --- Desktop Environment Detection ---
detect_and_set_wallpaper() {
    if [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
        set_wallpaper_hypr
    elif [ "$XDG_CURRENT_DESKTOP" = "sway" ]; then
        set_wallpaper_sway
    elif [[ "$XDG_CURRENT_DESKTOP" == *"KDE"* ]]; then
        set_wallpaper_kde
    else
        echo "Unsupported desktop environment: $XDG_CURRENT_DESKTOP"
        return 1
    fi
}

# === Execute ===
detect_and_set_wallpaper


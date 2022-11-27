#!/bin/bash
status=" Battery: $(cat /sys/class/power_supply/BAT0/capacity)% \n Time: $(date +"%H:%M") \n $(set -- $(sensors | grep -i core | tr -d "+"); printf '%s\n' "CPU: $4") \n Disk:$(df -h --output=avail /home | grep G ) \n Wi-fi: $(iwgetid -r) \n Workspaces: $(swaymsg -t get_workspaces | jq '.[] | .num' | tr '\n' ' ') \n Uptime: $(uptime -p) \n Brightness: $(brightnessctl | awk -F"[()]" '$2 {print $2}')"

notify-send -t 4000 "Info" "$status"

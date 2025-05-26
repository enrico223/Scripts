#!/bin/bash

status=" Battery: $(cat /sys/class/power_supply/BAT0/capacity)% \n Date: $(date +"%d/%m/%y") \n Time: $(date +"%H:%M") \n $(set -- $(sensors | grep -i core | tr -d "+"); printf '%s\n' "CPU: $4") \n Disk:$(df -h --output=avail /home | grep G ) \n Wi-fi: $(nmcli connection show --active | grep wifi | awk '{print $1}') \n Workspaces: $(swaymsg -t get_workspaces | jq '.[] | .num' | tr '\n' ' ' || hyprctl workspaces | grep \([1-9]\) | awk '{print $3}') \n Powermode: $(tuned-adm active | awk '{print $NF}') \n Uptime: $(uptime -p) \n Brightness: $(brightnessctl | awk -F"[()]" '$2 {print $2}')"

if [ $DESKTOP_SESSION == hyprland ]; then
	status=" Battery: $(cat /sys/class/power_supply/BAT0/capacity)% \n Date: $(date +"%d/%m/%y") \n Time: $(date +"%H:%M") \n $(set -- $(sensors | grep -i core | tr -d "+"); printf '%s\n' "CPU: $4") \n Disk:$(df -h --output=avail /home | grep G ) \n Wi-fi: $(nmcli connection show --active | grep wifi | awk '{print $1}') \n Workspaces: $(hyprctl workspaces | grep \([1-9]\) | awk '{print $3}' ORS=" ") \n Powermode: $(tuned-adm active | awk '{print $NF}') \n Uptime: $(uptime -p) \n Brightness: $(brightnessctl | awk -F"[()]" '$2 {print $2}')"
	notify-send -t 4000 "Info" "$status"
elif [ $DESKTOP_SESSION == Sway ]; then
	status=" Battery: $(cat /sys/class/power_supply/BAT0/capacity)% \n Date: $(date +"%d/%m/%y") \n Time: $(date +"%H:%M") \n $(set -- $(sensors | grep -i core | tr -d "+"); printf '%s\n' "CPU: $4") \n Disk:$(df -h --output=avail /home | grep G ) \n Wi-fi: $(nmcli connection show --active | grep wifi | awk '{print $1}') \n Workspaces: $(swaymsg -t get_workspaces | jq '.[] | .num' | tr '\n' ' ') \n Powermode: $(tuned-adm active | awk '{print $NF}') \n Uptime: $(uptime -p) \n Brightness: $(brightnessctl | awk -F"[()]" '$2 {print $2}')"
	notify-send -t 4000 "Info" "$status"
else 
	notify-send "Unsupported desktop session: $DESKTOP_SESSION"
	exit 1
fi


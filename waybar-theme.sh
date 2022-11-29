#!/usr/bin/env bash

themes=(tokyonight powerline cotton\ factory)
echo "Select a theme:"
select theme in "${themes[*]}"; do
	case $theme in
		tokyonight)
			cat /home/enrico/.config/waybar/tokyo-night.css > /home/enrico/.config/waybar/style.css
			cat /home/enrico/.config/waybar/tokyo-night-config > /home/enrico/.config/waybar/config

read selected_theme

if [[$selected_theme -eq "tokyonight"]]
then 
	cat /home/enrico/.config/waybar/tokyo-night.css > /home/enrico/.config/waybar/style.css
	cat /home/enrico/.config/waybar/tokyo-night-config > /home/enrico/.config/waybar/config
elif [[$selected_theme -eq "powerline"]]
	cat /home/enrico/.config/waybar/powerline.css > /home/enrico/.config/waybar/style.css
	cat /home/enrico/.config/waybar/powerline_config > /home/enrico/.config/waybar/config
elif [[$selected_theme -eq "cotton factory"]]
	cat /home/enrico/.config/waybar/cotton_factory.css > /home/enrico/.config/waybar/style.css
	cat /home/enrico/.config/waybar/cotton_factory_config > /home/enrico/.config/waybar/config
fi

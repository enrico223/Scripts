#!/usr/bin/env bash

themes=(tokyonight powerline cotton\ factory)
echo "Select a theme:"
select theme in "${themes[*]}"; do
	case $theme in
		"tokyonight")
			cat /home/enrico/.config/waybar/tokyo-night.css > /home/enrico/.config/waybar/style.css
			cat /home/enrico/.config/waybar/tokyo-night-config > /home/enrico/.config/waybar/config;
		break
		"powerline"
			cat /home/enrico/.config/waybar/powerline.css > /home/enrico/.config/waybar/style.css
			cat /home/enrico/.config/waybar/powerline_config > /home/enrico/.config/waybar/config
		break
		"cotton factory"
			cat /home/enrico/.config/waybar/cotton_factory.css > /home/enrico/.config/waybar/style.css
			cat /home/enrico/.config/waybar/cotton_factory_config > /home/enrico/.config/waybar/config
		break
	esac
done
 



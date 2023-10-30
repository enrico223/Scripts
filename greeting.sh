#!/usr/bin/env bash

battery = $(cat /sys/class/power_supply/BAT0/capacity)
temperature = $(sensors | awk 'NR==8{print $2}') 



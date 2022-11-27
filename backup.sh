#!/bin/sh
set -x 

rsync -rvah /home/enrico/Documents/tirocinio_maeci/ /run/media/enrico/FCEC-9008/tirocinio > /home/enrico/Scripts/logs/last_backup.txt 
notify-send "Backup done"

#if [ $(date +%R) == '9:30' ]; then
#		rsync -rvah /home/enrico/Documents/tirocinio_maeci/ 
#/run/media/enrico/FCEC-9008/tirocinio > /home/enrico/Scripts/logs/last_backup.txt 
#		notify-send "Backup done"
#fi

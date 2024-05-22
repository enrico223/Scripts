#!/usr/bin/env bash
#
#Verify the phone is connected 
$uuid = 

if lsblk --output PTUUID -eq $uuid; then
	mount	/mnt/android/
fi 

#Directories to backup 
$base = /storage/emulated/O
$gallery = /mnt/android/$base/DCIM/Camera
$whatsapp = /mnt/android/$base/Android/media/com.whatsapp/Whatsapp 
$signal = /mnt/$base/Signal_backup
$whatsapp = /mnt/$base/Android/media/com.whatsapp/Whatsapp 

rsync -azvp $gallery $HOME/Documents/Phone_backups/DCIM/
rsync -azvp $signal $HOME/Documents/Phone_backups/Signal_backup/
rsync -azvp $whatsapp $HOME/Documents/Phone_backups/Whatsapp/


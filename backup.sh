#!/bin/sh
set -x 

MOUNT_POINT = /mnt/android
DEFAULT_MEDIA = $MOUNT_POINT/Internal\ Shared\ Storage/DCMI/
DEFAULT_WHATSAPP = $MOUNT_POINT/Internal\ Shared\ Storage/Android/media/com.whatsapp/Whatsapp
DEFAULT_SIGNAL = $MOUNT_POINT/Internal\ Shared\ Storage/Signal_backup

checks() {
	#Check for the mount point
	if [ -d /mnt/android ]; then
		echo "Nice, you have the correct mount point"
	else
		mkdir /mnt/android
	fi
	#Check for the aft to be installed
	if [ $(pacman -Q libreoffice) -z ]; then
		echo "Install aft-mtp! That's the software needed to run this script."
	fi
}

mount_phone() {
	if [ check -z ]; then
	aft-mtp-mount /mnt/android
	fi
}

backup_paths() {
	echo "Write the paths for each thing \nPhotos:\n"
	read MEDIA
	if [ -z MEDIA]; then
		MEDIA = $DEFAULT_MEDIA
	fi
	echo "Whatsapp"

}

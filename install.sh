#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
	DEST_ICONS=~/.icons
	DEST_THEME=~/.themes
	MSG="Installing theme locally..."
else
	DEST_ICONS=/usr/share/icons
	DEST_THEME=/usr/share/themes
	MSG="Installing theme globally..."
fi

echo $MSG
sleep 1

mkdir -p $DEST_ICONS/MacOS-Gnome-Icons
mkdir -p $DEST_THEME/MacOS-Gnome-Theme

if [ ! -x "$(command -v rsync)" ]; then
	cp -R -v Custom-Icons/* $DEST_ICONS/MacOS-Gnome-Icons/
	cp -R -v Custom-Theme/* $DEST_THEME/MacOS-Gnome-Theme/
else
	rsync -hazv Custom-Icons/ $DEST_ICONS/MacOS-Gnome-Icons/
	rsync -hazv Custom-Theme/ $DEST_THEME/MacOS-Gnome-Theme/
fi

echo "Done!"

#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
	echo "Installing theme locally..."
	sleep 1
	[ ! -d ~/.icons ] && mkdir ~/.icons
	[ ! -d ~/.themes ] && mkdir ~/.themes

	mkdir -p ~/.themes/MacOS-Gnome-Theme
	echo "Copying files to ~/.themes"
	cp -R Custom-Theme/* ~/.themes/MacOS-Gnome-Theme

	mkdir -p ~/.icons/MacOS-Gnome-Icons
	echo "Copying files to ~/.icons"
	cp -R Custom-Icons/* ~/.icons/MacOS-Gnome-Icons

	#echo "Changing buttons position"
	#gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

	echo "Done!"
	echo "You might need to restart Gnome for some changes to take effect."
else
	echo "Installing theme globally..."
	sleep 1

	mkdir -p /usr/share/icons/MacOS-Gnome-Icons
	echo "Copying files to /usr/share/icons/MacOS-Gnome-Icons"
	cp -R Custom-Icons/* /usr/share/icons/MacOS-Gnome-Icons

	mkdir -p /usr/share/themes/MacOS-Gnome-Theme
	echo "Copying files to /usr/share/icons/MacOS-Gnome-Theme"
	cp -R Custom-Theme/* /usr/share/themes/MacOS-Gnome-Theme

	#echo "Changing buttons position"
	#gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

	echo "Done!"
	echo "You might need to restart Gnome for some changes to take effect."
fi

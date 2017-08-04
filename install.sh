#!/bin/bash

if [[ $(id -u) -ne 0 ]];then
	echo "Installing theme globally..."
	sleep 1
	global_install()
else
	echo "Installing theme locally..."
	sleep 1
	local_install()
fi

function local_install() {
	[ ! -d ~/.icons ] && mkdir ~/.icons
	[ ! -d ~/.themes ] && mkdir ~/.themes

	echo "Copying files to ~/.icons"
	mkdir -p ~/.icons/MacOS-Gnome-Icons
	echo "Copying files to ~/.themes"
	mkdir -p ~/.themes/MacOS-Gnome-Theme

	cp -R Custom-Icons/* ~/.icons/MacOS-Gnome-Icons
	cp -R Custom-Theme/* ~/.themes/MacOS-Gnome-Theme

	echo "Changing buttons position"
	gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

	echo "Done!"
	echo "You might need to restart Gnome for some changes to take effect."
}

function global_install() {
	mkdir -p /usr/share/icons/MacOS-Gnome-Icons
	mkdir -p /usr/share/themes/MacOS-Gnome-Theme

	cp -R Custom-Icons/* /usr/share/icons/MacOS-Gnome-Icons
	cp -R Custom-Theme/* /usr/share/themes/MacOS-Gnome-Icons

	echo "Changing buttons position"
	gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

	echo "Done!"
	echo "You might need to restart Gnome for some changes to take effect."
}


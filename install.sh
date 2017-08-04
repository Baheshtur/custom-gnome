#!/bin/bash

[ ! -d ~/.icons ] && mkdir ~/.icons
[ ! -d ~/.themes ] && mkdir ~/.themes

echo "Copying files to ~/.icons"
mkdir -p ~/.icons/MacOS-Gnome-Icons
echo "Copying files to ~/.themes"
mkdir -p ~/.themes/MacOS-Gnome-Theme

cp -R Custom-Icons/* ~/.icons/MacOS-Gnome-Icons
cp -R Custom-Theme/* ~/.themes/MacOS-Gnome-Theme
cd ../
rm -rf custom-gnome
echo "Cleaning up"
echo "Changing buttons position"
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

echo "Done!"
echo "You might need to restart Gnome for some changes to take effect."

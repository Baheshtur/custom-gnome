[ ! -d ~/.icons ] && mkdir ~/.icons
[ ! -d ~/.themes ] && mkdir ~/.themes

echo "Copying files to ~/.icons"
mkdir -p ~/.icons/MacOS-Gnome
echo "Copying files to ~/.themes"
mkdir -p ~/.themes/MacOS-Gnome

cp -R Custom-Icons/* ~/.icons
cp -R Custom-Theme/* ~/.themes
cd ../
rm -r custom-gnome
echo "Cleaning up"

echo "Done!"

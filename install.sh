#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/Documents/dotfiles                # dotfiles directory
olddir=~/Documents/dotfiles/backup             # old dotfiles backup directory
home_files="zshrc"    # list of files/folders to symlink in homedir
config_files="compton.conf i3 polybar rofi" # list of files to symlink in ~/.config
document_files="scripts"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"
echo
echo

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $home_files; do
    echo "backing up current home files to $olddir"
    mv ~/.$file $olddir
    echo "linking to $file in home directory"
    ln -s $dir/$file ~/.$file
done
echo
echo

for file in $config_files; do
	echo "backing up current config files to $olddir"
	mv ~/.config/$file $olddir
	echo "linking to $file in config directory"
	ln -s $dir/$file ~/.config/$file
done
echo
echo

for file in $document_files; do
	echo "backing up current document files to $olddir"
	mv ~/Documents/$file $olddir
	echo "linking to $file in documents directory"
	ln -s $dir/$file ~/Documents/$file
done
echo
echo

echo "requiring sudo permission to install the sddm theme"
sudo cp --recursive $dir/chili /usr/share/sddm/themes/chili

cd $dir
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
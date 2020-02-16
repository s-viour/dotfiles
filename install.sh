#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/documents/dotfiles                # dotfiles directory
olddir=~/documents/dotfiles/_backup             # old dotfiles backup directory
home_files="zshrc"    # list of files/folders to symlink in homedir
config_files="picom.conf polybar rofi openbox" # list of files to symlink in ~/.config

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
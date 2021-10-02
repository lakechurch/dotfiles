#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/workspace/dotfiles
############################

########## Variables
dir=$HOME/workspace/dotfiles                    # dotfiles directory
olddir=$HOME/workspace/dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="tmux.conf bash_profile bashrc vim vimrc gitconfig zshrc aliases oh-my-zsh"
##########

########## Symlinks for dotfiles
# create backup in dotfiles_old in workspace
echo "Creating $olddir for backup of any existing dotfiles in ~/workspace"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv $HOME/.$file $HOME/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file $HOME/.$file
done

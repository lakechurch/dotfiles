#!/bin/bash

# Install needed apps
# Rust, rustup, and cargo
curl https://sh.rustup.rs -sSf | sh  
pip3 install black
pip3 install flake8
pip3 install isort
pip3 install codespell
npm install -g prettier


## First determine Linux OS
if grep -q ID=ubuntu "/etc/os-release"; then
  ########## Install
  apt install eza
  bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
  ##########

  apt install nodejs
  sudo apt install shellcheck

  ########## Install zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
if grep -q ID=arch "/etc/os-release"; then
  sudo pacman -S eza --needed --noconfirm
  sudo pacman -S llvm --needed --noconfirm
  sudo pacman -S shellcheck
  sudo pacman -S lib32-glibc
  sudo pacman -S ripgrep
fi


########## Git Submodule(s)
#echo "Initializing submodules"
#git submodule update --init --recursive
##########

#!/usr/bin/bash
#TODO : Pacman uses -s so make it according ot id
#TODO : Installing depending on the OS required packages
# Learn about docker and run this in a docker image

#Detecting the Os or Distribution to install package_manager accordingly
if uname -a | grep -qi "Ubuntu" &>/dev/null; then #q->quiet i->case insensitive
  echo "Ubuntu Detected..."
  package_manager="apt"
  sudo apt update && sudo apt upgrade
elif uname -a | grep -qi "Arch" &>/dev/null; then
  echo "Arch Detected..."
  package_manager="pacman"
  sudo pacman -Syu && sudo pacman -Syyu
elif uname -a | grep -qi "Mac" &>/dev/null; then
  echo "MacOs Detected"
else
  echo "Ummm.. idk which OS / Distro is this "
  exit 1
fi

install_package() {
  local package=$1
  if ! command -v ${package} &>/dev/null; then
    echo "Installing ${package}"
    sudo ${package_manager} install ${package} #Fix : Pacman -s
  else
    echo "${package} is already installed"
    echo "skipping it ....."
  fi
}
install_package zsh
install_package kitty
install_package tmux
install_package stow
install_package neovim

echo "Installing dotfiles ...."
cd ~ #Making sure download takes place in homedir otherwise stow causes problems
git clone https://github.com/BABAR-TAHSEEN55/mydotfiles.git
cd mydotfiles
stow .

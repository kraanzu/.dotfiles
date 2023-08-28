#! /usr/bin/env bash

# UPDATE system and install packages
sudo pacman -Syyu
sudo pacman --noconfirm --needed -S yay

# install all the installed packages
# while loop so that if anything does not install
# then the script doesn't stop
while read pkg; do yay -S --needed --noconfirm $pkg; done < packages.txt

mkdir -p ~/.undodir # nvim undo dir

G='\033[0;32m' 
Y='\033[1;32m'
R='\033[0;31m'
B='\033[0;34m'
END='\033[0m'

# STOW all the configs
echo -e "${G}[+] Setting up configs...${END}"
stow configs/

# Installs nord icons
echo -en "${G}[+] Setting up icons...  ${END}"
mkdir -p ~/.icons
tar -xf ~/.dotfiles/others/files/icons.tar.xz -C ~/.icons

# Outro
echo -e "${G}Done!${END}"
echo
echo -e "${R}Happy Hacking <3${END}"

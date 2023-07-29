#! /usr/bin/env bash

# UPDATE system and install packages
sudo pacman -Syyu
sudo pacman --noconfirm --needed -S yay

# install all the installed packages
while read pkg; do yay -S --needed --noconfirm $pkg; done < packages.txt

mkdir -p ~/.undodir # vim undo dir

# STOW all the configs
echo "TIME TO STOW THE CONFIGSSS...\n\n"

G='\033[0;32m'   #'0;32' is Green's ANSI color code
Y='\033[1;32m'   #'1;32' is Yellow's ANSI color code
R='\033[0;31m'
B='\033[0;34m'
END='\033[0m'

for f in *; do
  if [[ -d "$f" ]] && [[ "$f" != "others"  ]]; then
    echo -e "${G}[+] Setting up ${f} ...${END}"

    # check for already-present configs
    if [[ -d ~/.config/${f} ]]; then
      echo -en "${B}[!] Config for ${f} already present... Moving to ~/.config/${f}.old${END}...  "
      mv ~/.config/${f} ~/.config/${f}.old
      echo -e "${G}Done!${END}"
    fi

    echo 
    stow $f
  fi
done

echo -en "${G}[+] Setting up icons..  ${END}"
mkdir -p ~/.icons
tar -xf ~/.dotfiles/others/files/icons.tar.xz -C ~/.icons

echo -e "${G}Done!${END}"

echo
echo -e "${R}Happy Hacking <3${END}"

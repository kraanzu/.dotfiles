#! /usr/bin/env bash

# UPDATE system and install packages
sudo pacman -Syyu
sudo pacman --noconfirm -S yay
yay --needed --noconfirm -S - <packages.txt

mkdir -p ~/.undoir # vim undo dir

# STOW all the configs
for f in *; do
  if [[ -d "$f" ]]; then
    echo Setting up ${f} ...

    # check for already-present configs
    if [[ -d ~/.config/${f} ]]; then
      echo Config for ${f} already present... Moving to ~/.config/${f}.old
      mv ~/.config/${f} ~/.config/${f}.old
    fi

    stow $f
  fi
done

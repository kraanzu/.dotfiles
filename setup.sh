#! /usr/bin/env bash

# UPDATE system and install packages
sudo pacman -Syyu
sudo pacman --noconfirm -S yay
yay --needed --noconfirm -S - < packages.txt

chsh -s /usr/bin/fish

# VIM Plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim/undodir # vim undos for life

# STOW all the folders
for f in *; do
  if [[ -d ${f} ]];then
    stow ${f}
  fi
done

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh #rust is the future

{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
with lib.mynix;

let
  cfg = config.mynix.utils;
in
{
  options.mynix.utils = {
    enable = mkBoolOpt true "Enable all utility applications";
  };

  config = {
    home.packages =
      with pkgs;
      mkIf cfg.enable [
        libreoffice
        gdrive3
        syncthing
        obsidian
        yt-dlp
        zathura
        caffeine-ng
        nemo

        # Disk utilities
        gparted
        ntfs3g
        gnome-disk-utility

        # coding stuff
        direnv
        tree-sitter
        gh

        # must-have
        killall
        wget
        git
        htop
        os-prober
        geoclue2
        unzip
        zip
        ripgrep
        bluez
        tree
        tokei
        bat
        delta
        zoxide
        imagemagick
        popsicle
        wmctrl
        poppler-utils
        img2pdf
        stow
        jq
        ddcutil
        entr
        networkmanagerapplet
        rclone
      ];
  };
}

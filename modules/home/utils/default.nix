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

        # Disk utilities
        gparted
        ntfs3g
        gnome-disk-utility

        # coding stuff
        gemini-cli
        claude-code
        direnv
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
        xclip
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
        xdotool
        poppler-utils
        img2pdf
        stow
        sct
        jq
        ddcutil
      ];
  };
}

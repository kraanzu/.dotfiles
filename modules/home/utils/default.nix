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
    systemd.user.services.rclone-bisync = {
      Unit.Description = "Rclone bisync";
      Service.ExecStart = "${pkgs.rclone}/bin/rclone bisync gdrive:Docs %h/Docs";
    };

    systemd.user.timers.rclone-bisync = {
      Unit.Description = "Rclone bisync timer";
      Timer = {
        OnCalendar = "*-*-* 00/5:00:00";
        Persistent = true;
      };
      Install.WantedBy = [ "timers.target" ];
    };

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
        fd
      ];
  };
}

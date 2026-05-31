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
    cli.enable = mkBoolOpt true "Enable CLI utility packages";
    gui.enable = mkBoolOpt false "Enable GUI utility packages";
  };

  config = mkMerge [
    (mkIf cfg.cli.enable {
      systemd.user.services.rclone-bisync = {
        Unit.Description = "Rclone bisync";
        Service.ExecStart = "${pkgs.rclone}/bin/rclone bisync gdrive:Docs /drives/HDD/Docs";
      };

      systemd.user.timers.rclone-bisync = {
        Unit.Description = "Rclone bisync timer";
        Timer = {
          OnCalendar = "*-*-* 00/5:00:00";
          Persistent = true;
        };
        Install.WantedBy = [ "timers.target" ];
      };

      programs.direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };

      home.packages = with pkgs; [
        killall
        wget
        git
        htop
        os-prober
        unzip
        zip
        ripgrep
        tree
        tokei
        bat
        delta
        zoxide
        jq
        fd
        entr
        hyperfine
        socat
        smem
        stow
        rclone
        timer
        ntfs3g
        tree-sitter
        gh
        devenv
        mynix.crule
      ];
    })

    (mkIf cfg.gui.enable {
      home.packages = with pkgs; [
        libreoffice
        gdrive3
        syncthing
        obsidian
        yt-dlp
        zathura
        caffeine-ng
        nemo
        gparted
        gnome-disk-utility
        popsicle
        imagemagick
        wmctrl
        poppler-utils
        img2pdf
        geoclue2
        bluez
        networkmanagerapplet
        ddcutil
      ];
    })
  ];
}

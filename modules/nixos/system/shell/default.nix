{
  pkgs,
  namespace,
  lib,
  config,
  ...
}: let
  cfg = config.${namespace}.system.shell;
in {
  options.${namespace}.system.shell.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Setup shell";
  };

  config = lib.mkIf cfg.enable {
    programs.fish.enable = true;

    programs.fish.shellAliases = {
      nix-shell = "nix-shell --run fish";
      cleanup = "nix-env --delete-generations 3d &&  home-manager expire-generations \"-3 days\" && nix-collect-garbage -d";
    };
    environment.systemPackages = with pkgs; [
      # basic utilties
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
      pulseaudio
      tree
      home-manager
      cloc
      imagemagick
      popsicle
      wmctrl
      xdotool

      # shell stuff
      fish
      starship
      eza

      # others
      qbittorrent
    ];
  };
}

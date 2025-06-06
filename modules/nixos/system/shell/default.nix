{
  pkgs,

  lib,
  config,
  ...
}:
let
  cfg = config.mynix.system.shell;
in
{
  options.mynix.system.shell.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Setup shell";
  };

  config = lib.mkIf cfg.enable {
    programs.fish.enable = true;

    programs.fish = {
      shellAliases = {
        nix-shell = "nix-shell --run fish";
        cleanup = "nix-env --delete-generations 3d && nix-collect-garbage -d";
      };
      interactiveShellInit = ''
        function runshell
          if test (count $argv) -eq 1
            nix develop ~/.dotfiles/#$argv[1]
          else
            echo "Usage: runshell <shell-name>"
          end
        end
      '';
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
    ];
  };
}

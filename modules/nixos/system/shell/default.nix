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
    default = true;
    description = "Setup shell";
  };

  config = lib.mkIf cfg.enable {
    programs.fish.enable = true;

    programs.fish = {
      shellAliases = {
        nix-shell = "nix-shell --run fish";
      };
      shellInit = ''
        if test -e ${pkgs.conda}/bin/conda
          eval ${pkgs.conda}/bin/conda "shell.fish" "hook" $argv | source
        end
      '';
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
      fish
      starship
      eza
    ];
  };
}

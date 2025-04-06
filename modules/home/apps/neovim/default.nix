{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.neovim;
in
{
  options.mynix.apps.neovim = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable neovim";
    };
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        python3Packages.debugpy
        nodejs_22 # copilot
        ctags # toggle bar
        gcc # Treesiter
      ];
    };
  };
}

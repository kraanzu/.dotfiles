{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.neovim;
in {
  options.${namespace}.apps.neovim = {
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

    home.file = {
      "${namespace}.vim" = {
        source = ./config;
        target = ".config/nvim";
        recursive = true;
      };
    };
  };
}

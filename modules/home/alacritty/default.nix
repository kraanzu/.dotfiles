{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.tools.alacritty;
in {
  options.${namespace}.tools.alacritty.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable alacritty";
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = import ./alacritty_theme.nix;
    };
  };
}

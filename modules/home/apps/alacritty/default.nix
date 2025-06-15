{
  lib,
  config,

  ...
}:
let
  cfg = config.mynix.apps.alacritty;
in
{
  options.mynix.apps.alacritty.enable = lib.mkOption {
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

{
  pkgs,
  lib,
  config,

  ...
}:
let
  cfg = config.mynix.apps.wezterm;
in
{
  options = {
    mynix.apps.wezterm.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Wezterm";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wezterm
    ];
  };
}

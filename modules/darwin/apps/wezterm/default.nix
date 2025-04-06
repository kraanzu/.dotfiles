{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.mynix.apps.wezterm;
in {
  options = {
    mynix.apps.wezterm.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Wezterm";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wezterm
    ];
  };
}

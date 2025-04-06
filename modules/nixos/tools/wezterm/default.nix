{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.mynix.tools.wezterm;
in {
  options = {
    mynix.tools.wezterm.enable = lib.mkOption {
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

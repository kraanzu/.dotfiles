{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.apps.wezterm;
in {
  options = {
    ${namespace}.apps.wezterm.enable = lib.mkOption {
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

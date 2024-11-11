{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.tools.wezterm;
in {
  options = {
    ${namespace}.tools.wezterm.enable = lib.mkOption {
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

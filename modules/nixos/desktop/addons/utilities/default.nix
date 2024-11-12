# SDDM CHILI THEME
{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.desktop.utilities;
in {
  options = {
    ${namespace}.desktop.utilities.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable desktop utilities such as network manager, clipboard manager, etc.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      blueberry
      networkmanagerapplet
      xfce.xfce4-clipman-plugin
      caffeine-ng
      lxde.lxsession
      nautilus
    ];
  };
}

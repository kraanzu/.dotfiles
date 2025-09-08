# SDDM CHILI THEME
{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.desktop.utilities;
in
{
  options = {
    mynix.desktop.utilities.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable desktop utilities such as network manager, clipboard manager, etc.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      zathura
      blueberry
      networkmanagerapplet
      xfce.xfce4-clipman-plugin
      caffeine-ng
      lxsession
      nautilus
    ];
  };
}

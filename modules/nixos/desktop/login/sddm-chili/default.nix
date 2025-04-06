# SDDM CHILI THEME
{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.desktop.login.sddm-chili;
in
{
  options = {
    mynix.desktop.login.sddm-chili.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the SDDM Chili package.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.libsForQt5.qt5.qtgraphicaleffects
      pkgs.libsForQt5.qt5.qtquickcontrols2
    ];

    services.xserver.enable = true;
    services.displayManager.sddm = {
      enable = true;
      theme = "${pkgs.mynix.sddm-chili}";
    };
  };
}

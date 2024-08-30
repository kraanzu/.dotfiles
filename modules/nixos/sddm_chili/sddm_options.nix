# SDDM CHILI THEME

{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  sddm_chili_theme = import ./sddm_chili.nix {inherit pkgs;};
in {
  options = {
    sddm_chili.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the SDDM Chili package.";
    };
  };

  config = mkIf config.sddm_chili.enable {
    environment.systemPackages = [
      pkgs.libsForQt5.qt5.qtgraphicaleffects
      pkgs.libsForQt5.qt5.qtquickcontrols2
      sddm_chili_theme
    ];

    services.displayManager.sddm = {
      enable = true;
      theme = "${sddm_chili_theme}";
    };
  };
}

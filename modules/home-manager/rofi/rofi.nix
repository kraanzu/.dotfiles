{
  pkgs,
  lib,
  config,
  osConfig,
  ...
}: let
  rofi_modes = [
    # default modes
    "window"
    "drun"
    "run"
    "ssh"
    "combi"

    # simple plugins
    "emoji"

    # extra config
    "power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu"
  ];
in {
  config = lib.mkIf osConfig.mynix.services.x11.enable {
    programs.rofi = {
      enable = true;
      plugins = with pkgs; [
        rofi-power-menu
        rofi-emoji
      ];
      extraConfig = {
        modes = lib.concatStringsSep "," rofi_modes;
      };

      theme = import ./rofi-theme.nix {
        mkLiteral = config.lib.formats.rasi.mkLiteral;
      };
    };
  };
}

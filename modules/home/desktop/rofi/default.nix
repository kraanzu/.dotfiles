{
  pkgs,
  lib,
  config,

  ...
}:
let
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
  cfg = config.mynix.desktop.rofi;
in
{
  options.mynix.desktop.rofi.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable rofi";
  };

  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      rofi-bluetooth
      mynix.rofi-audio-switcher
    ];
    programs.rofi = {
      enable = true;
      plugins = with pkgs; [
        rofi-power-menu
        rofi-emoji
      ];
      extraConfig = {
        modes = lib.concatStringsSep "," rofi_modes;
      };

      theme = "nord.rasi";
    };
  };
}

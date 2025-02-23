{
  pkgs,
  lib,
  config,
  namespace,
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
  cfg = config.${namespace}.desktop.rofi;
in {
  options.${namespace}.desktop.rofi.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable rofi";
  };

  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
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

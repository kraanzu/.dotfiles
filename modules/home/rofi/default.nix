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
  cfg = config.${namespace}.rofi;
in {
  options.${namespace}.rofi.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable rofi";
  };

  config = lib.mkIf cfg.enable {
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

{
  pkgs,
  lib,
  config,
  ...
}:
let
  rofi_modes = [
    "window"
    "drun"
    "run"
    "ssh"
    "combi"
    "bluetooth:rofi-bluetooth"
    "audio:rofi-audio-switcher"
    "power:rofi-power-menu"
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
      mynix.rofi-scripts
    ];
    programs.rofi = {
      enable = true;
      extraConfig = {
        case-sensitive = false;
        modes = lib.concatStringsSep "," rofi_modes;
      };

      theme = "nord.rasi";
    };
  };
}

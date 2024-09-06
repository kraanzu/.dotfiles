{
  pkgs,
  lib,
  config,
  osConfig,
  ...
}: let
  default_modes = "window,drun,run,ssh,combi";
  plugin_modes = "emoji";
  power_mode = "power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
  rofi_modes = "${default_modes},${plugin_modes},${power_mode}";
in {
  config = lib.mkIf osConfig.mynix.x11.enable {
    programs.rofi = {
      enable = true;
      plugins = with pkgs; [
        rofi-power-menu
        rofi-emoji
      ];
      extraConfig = {
        modes = rofi_modes;
      };

      theme = import ./rofi-theme.nix {
        mkLiteral = config.lib.formats.rasi.mkLiteral;
      };
    };
  };
}

{
  pkgs,
  lib,
  config,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.mynix.x11.enable {
    programs.rofi = {
      enable = true;
      plugins = with pkgs; [
        rofi-power-menu
        rofi-emoji
      ];
      extraConfig = {
        modes = "window,drun,run,ssh,combi,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
      };

      theme = import ./rofi-theme.nix {
        mkLiteral = config.lib.formats.rasi.mkLiteral;
      };
    };
  };
}

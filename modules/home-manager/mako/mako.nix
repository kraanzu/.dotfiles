{
  pkgs,
  lib,
  osConfig,
  ...
}: let
  bg = "#252a34";
  blue = "#81A1C1";
in {
  config = lib.mkIf osConfig.mynix.services.wayland.enable {
    home.packages = with pkgs; [
      mako
      libnotify
    ];
    services.mako = {
      enable = true;
      backgroundColor = bg;
      borderColor = blue;
      borderSize = 3;
      defaultTimeout = 5000;
    };
  };
}

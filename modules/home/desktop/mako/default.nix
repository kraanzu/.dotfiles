{
  pkgs,
  lib,
  namespace,
  config,
  ...
}: let
  bg = "#252a34";
  blue = "#81A1C1";
  cfg = config.${namespace}.desktop.mako;
in {
  options.${namespace}.desktop.mako.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable mako";
  };

  config = lib.mkIf cfg.enable {
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

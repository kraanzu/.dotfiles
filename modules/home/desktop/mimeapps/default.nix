{

  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mynix.desktop.mimeapps;
in
{
  options.mynix.desktop.mimeapps.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable mimeapps";
  };

  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    xdg.mimeApps.defaultApplications = {
      "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];
    };
  };
}

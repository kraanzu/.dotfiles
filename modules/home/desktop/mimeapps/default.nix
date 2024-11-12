{
  namespace,
  config,
  lib,
  ...
}: let
  cfg = config.${namespace}.desktop.mimeapps;
in {
  options.${namespace}.desktop.mimeapps.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable mimeapps";
  };

  config = lib.mkIf cfg.enable {
    xdg.mimeApps.defaultApplications = {
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "x-scheme-handler/chrome" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
      "application/x-extension-htm" = ["firefox.desktop"];
      "application/x-extension-html" = ["firefox.desktop"];
      "application/x-extension-shtml" = ["firefox.desktop"];
      "application/xhtml+xml" = ["firefox.desktop"];
      "application/x-extension-xhtml" = ["firefox.desktop"];
      "application/x-extension-xht" = ["firefox.desktop"];
      "x-scheme-handler/tg" = ["org.telegram.desktop.desktop"];
    };
  };
}

{

  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.mynix;
let
  cfg = config.mynix.suites.common;
in
{
  options.mynix.suites.common.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable common suite";
  };

  config = lib.mkIf cfg.enable {
    mynix = {
      apps = {
        firefox = enabled;
        neovim = enabled;
        qbittorrent = enabled;
        zed = enabled;
      };
      desktop = {
        wallpapers = enabled;
        nord_theme = enabled;
        mimeapps = enabled;
      };
      projects = {
        # dooit = enabled;
      };
    };
  };
}

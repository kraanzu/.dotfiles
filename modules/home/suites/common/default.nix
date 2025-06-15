{
  config,
  lib,
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
        brave = enabled;
        wezterm = enabled;
        neovim = enabled;
        qbittorrent = enabled;
        anydesk = enabled;

        disk-utilities = enabled;
        libreoffice = enabled;
      };
      desktop = {
        wallpapers = enabled;
        nord_theme = enabled;
        mimeapps = enabled;
      };
      cli = {
        gdrive = enabled;
        git-crypt = enabled;
        protonvpn = enabled;
      };
    };
  };
}

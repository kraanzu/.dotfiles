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
        neovim = enabled;
        qbittorrent = enabled;
        zed = enabled;
        anydesk = enabled;
        brave = enabled;
        discord = enabled;
        chrome = enabled;
        code-cursor = enabled;
        disk-utilities = enabled;
        libreoffice = enabled;
        postman = enabled;
        simplescreenrecorder = enabled;
        telegram = enabled;
        vlc = enabled;
        vscode = enabled;
        wezterm = enabled;
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

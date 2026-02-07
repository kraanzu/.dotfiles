{
  lib,
  config,
  ...
}:
with lib.mynix;
{
  mynix = {
    desktop = {
      rofi = enabled;
      dunst = enabled;
      wallpapers = enabled;
      nord_theme = enabled;
    };
    browsers = {
      brave = enabled;
      edge = enabled;
    };
    media.all = enabled;

    dev.apps.all = enabled;
    dev.lang = {
      rust = enabled;
      zig = enabled;
    };

    # sec = enabled;
  };

  xdg = {
    mimeApps = enabled;
    userDirs = {
      enable = true;
      createDirectories = false;
      videos = "${config.home.homeDirectory}/HDD/others/Videos";
    };
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}

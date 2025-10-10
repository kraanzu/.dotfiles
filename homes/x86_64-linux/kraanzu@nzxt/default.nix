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
      picom = enabled;
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
      cpp = enabled;
      go = enabled;
      python = enabled;
      lua = enabled;
      markdown = enabled;
      nix = enabled;
      rust = enabled;
    };

    sec = enabled;
  };

  xdg = {
    mimeApps = enabled;
    userDirs = {
      enable = true;
      createDirectories = false;
      videos = "${config.home.homeDirectory}/HDD/Videos";
    };
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}

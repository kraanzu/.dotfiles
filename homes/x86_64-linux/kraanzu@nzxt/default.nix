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
    utils.gui = enabled;
    utils.rclone-bisync = enabled;
    dev.lang = {
      python = enabled;
      go = enabled;
      lua = enabled;
      nix = enabled;
      bash = enabled;
      cpp = enabled;
      rust = enabled;
      markdown = enabled;
    };
    games.mindustry = enabled;
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
  home.stateVersion = "26.05";
}

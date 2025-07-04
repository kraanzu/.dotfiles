{
  lib,

  ...
}:
with lib.mynix;
let
  user_name = "kraanzu";
  user_email = "kraanzu@gmail.com";
in
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
      firefox = enabled;
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
      createDirectories = true;
    };
  };

  programs.git = {
    enable = true;
    userEmail = "${user_email}";
    userName = "${user_name}";
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}

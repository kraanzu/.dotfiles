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
    suites = {
      common = enabled;
      development = enabled;
    };
    apps = {
      spotify = enabled;
    };
    desktop = {
      rofi = enabled;
      dunst = enabled;
      picom = enabled;
    };
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
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

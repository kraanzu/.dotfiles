{
  lib,
  namespace,
  ...
}:
with lib.${namespace}; let
  user_name = "kraanzu";
  user_email = "kraanzu@gmail.com";
in {
  imports = [
    ./configs.nix
    ./mimeapps.nix
  ];
  mynix = {
    apps = {
      firefox = enabled;
    };
    desktop = {
      rofi = enabled;
      dunst = enabled;
      wallpapers = enabled;
      nord_theme = enabled;
    };
    terminals = {
      alacritty = enabled;
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
  home.stateVersion = "23.11";
}

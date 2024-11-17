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
    ./dotfiles.nix
  ];
  mynix = {
    suites = {
      common = enabled;
    };
    desktop = {
      rofi = enabled;
      dunst = enabled;
      picom = enabled;
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
  home.stateVersion = "25.05";
}

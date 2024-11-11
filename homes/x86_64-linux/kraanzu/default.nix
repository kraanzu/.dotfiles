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
    ./common
    ./theme.nix
    ./configs.nix
    ./wallpapers.nix
    ./mimeapps.nix
  ];
  mynix = {
    desktop.rofi = enabled;
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
}

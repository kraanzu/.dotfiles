{
  lib,
  namespace,
  ...
}:
with lib.${namespace}; let
  user_name = "kraanzu";
  user_email = "kraanzu@gmail.com";
in {
  mynix = {
    apps = {
      neovim = enabled;
    };
  };

  programs.git = {
    enable = true;
    userEmail = "${user_email}";
    userName = "${user_name}";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}

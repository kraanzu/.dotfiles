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
  programs.git = {
    enable = true;
    userEmail = "${user_email}";
    userName = "${user_name}";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}

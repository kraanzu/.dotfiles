{
  config,
  pkgs,
  ...
}: let
  user_name = "kraanzu";
  user_email = "kraanzu@gmail.com";
in {
  imports = [
    ../common
    ./theme.nix
    ./configs.nix
  ];

  home = {
    username = "${user_name}";
    homeDirectory = "/home/${user_name}";
  };

  programs.git = {
    enable = true;
    userEmail = "${user_email}";
    userName = "${user_name}";
  };
}

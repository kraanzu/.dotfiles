let
  user_name = "kraanzu";
  user_email = "kraanzu@gmail.com";
in {
  imports = [
    ../common
    ./theme.nix
    ./configs.nix
    ./wallpapers.nix
    ./mimeapps.nix
  ];

  home = {
    username = "${user_name}";
    homeDirectory = "/home/${user_name}";
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

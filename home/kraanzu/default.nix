{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common
    ./theme.nix
  ];

  home = {
    username = "kraanzu";
    homeDirectory = "/home/kraanzu";
  };

  programs.git = {
    enable = true;
    userEmail = "kraanzu@gmail.com";
    userName = "kraanzu";
  };
}

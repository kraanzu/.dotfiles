{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./configs.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "kraanzu";
    homeDirectory = "/home/kraanzu";
  };

  gtk.enable = true;
  qt.enable = true;

  gtk.theme.name = "Nordic";
  gtk.theme.package = pkgs.nordic;

  gtk.iconTheme.name = "Nordic-darker";
  gtk.iconTheme.package = pkgs.nordic;

  gtk.cursorTheme.name = "Nordic-cursor";
  gtk.cursorTheme.package = pkgs.nordic;

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userEmail = "kraanzu@gmail.com";
    userName = "kraanzu";
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}

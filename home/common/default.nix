{
  config,
  ...
}: {
  imports = [ ];

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}

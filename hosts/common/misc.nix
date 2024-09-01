{
  services.printing.enable = false;

  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg: true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.dconf.enable = true;
}

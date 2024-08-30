{
  networking.networkmanager.enable = true;

  services.printing.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
}

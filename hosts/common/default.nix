{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    # modules
    ../../modules/nixos

    ./boot.nix
    ./locale.nix
    ./sound.nix
    ./packages.nix
    ./misc.nix
    ./fish.nix
    ./redshift.nix
    ./fonts.nix
    ./usb.nix
    ./housekeeping.nix
    ./ld.nix
  ];

  system.stateVersion = "24.05";
}

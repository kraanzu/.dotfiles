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
    ./keymap.nix
    ./sound.nix
    ./packages.nix
    ./misc.nix
    ./fish.nix
    ./x11.nix
    ./redshift.nix
    ./fonts.nix
    ./usb.nix
  ];

  system.stateVersion = "24.05";

}

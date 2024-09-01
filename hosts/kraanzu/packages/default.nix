{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./utilities.nix
    ./coding.nix
    ./socials.nix
  ];
}

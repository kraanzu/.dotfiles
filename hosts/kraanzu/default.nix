{
pkgs,
inputs,
...
}:
{
  imports = [
  ../common/global
  ./hardware-configuration.nix
  ];
}

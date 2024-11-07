{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.dooit.overlay];

  environment.systemPackages = [
    pkgs.dooit
  ];
}

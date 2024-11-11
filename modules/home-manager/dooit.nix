{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.dooit.homeManagerModules.default
  ];

  nixpkgs.overlays = [inputs.dooit-extras.overlay];

  programs.dooit = {
    enable = true;
    extraPackages = [pkgs.dooit-extras];
  };
}

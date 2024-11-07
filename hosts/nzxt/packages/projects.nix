{
  inputs,
  pkgs,
  ...
}: let
  custom_dooit = pkgs.dooit.override {
    extraPackages = [
      pkgs.dooit-extras
    ];
  };
in {
  nixpkgs.overlays = [inputs.dooit.overlay inputs.dooit-extras.overlay];
  environment.systemPackages = [
    custom_dooit
  ];
}

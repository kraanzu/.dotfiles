{
  config,
  lib,
  pkgs,

  inputs,
  ...
}:
with lib;
let
  cfg = config.mynix.cli.dooit;
in
{
  options.mynix.cli.dooit = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable dooit";
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [ inputs.dooit-extras.overlay ];

    programs.dooit = {
      enable = true;
      extraPackages = [ inputs.dooit-extras.packages.${pkgs.system}.default ];
    };
  };
}

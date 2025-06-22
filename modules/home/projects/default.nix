{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
with lib.mynix;

let
  cfg = config.mynix.projects;
in
{
  options.mynix.projects = {
    all.enable = mkBoolOpt false "Enable all apps";

    dooit.enable = mkBoolOpt false "Enable dooit";
  };

  config = mkIf (cfg.dooit.enable || cfg.all.enable) {
    nixpkgs.overlays = [ inputs.dooit-extras.overlay ];

    programs.dooit = {
      enable = true;
      extraPackages = [ inputs.dooit-extras.packages.${pkgs.system}.default ];
    };
  };
}

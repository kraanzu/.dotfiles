{
  config,
  lib,
  pkgs,
  namespace,
  inputs,
  ...
}:
with lib; let
  cfg = config.${namespace}.projects.dooit;
in {
  options.${namespace}.projects.dooit = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable dooit";
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [inputs.dooit-extras.overlay];

    programs.dooit = {
      enable = true;
      extraPackages = [ inputs.dooit-extras.packages.${pkgs.system}.default ];
    };
  };
}

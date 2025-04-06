{
  config,
  lib,
  pkgs,
  namespace,
  inputs,
  ...
}:
with lib; let
  cfg = config.mynix.projects.dooit;
in {
  options.mynix.projects.dooit = {
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

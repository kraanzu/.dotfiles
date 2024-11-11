{
  options,
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.archetypes.workstation;
in {
  options.${namespace}.archetypes.workstation = with types; {
    enable = mkBoolOpt false "Whether or not to enable the workstation archetype.";
  };

  config = mkIf cfg.enable {
    mynix = {
      suites = {
        common = enabled;
        desktop = enabled;
        development = enabled;
        social = enabled;
      };
    };
  };
}

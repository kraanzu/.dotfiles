{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.archetypes.workstation;
in {
  options.${namespace}.archetypes.workstation.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Workstation archetype.";
  };

  config = mkIf cfg.enable {
    mynix = {
      suites = {
        common = enabled;
      };
    };
  };
}

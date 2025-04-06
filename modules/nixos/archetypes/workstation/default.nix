{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.mynix; let
  cfg = config.mynix.archetypes.workstation;
in {
  options.mynix.archetypes.workstation.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Workstation archetype.";
  };

  config = mkIf cfg.enable {
    mynix = {
      suites = {
        common = enabled;
        desktop = enabled;
        development = enabled;
        social = enabled;
        media = enabled;
      };
    };
  };
}

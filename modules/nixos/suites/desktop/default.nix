{
  namespace,
  lib,
  config,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.suites.desktop;
in {
  options.${namespace}.suites.desktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Desktop Config";
  };

  config = mkIf cfg.enable {
    mynix = {
      suites = {
        common = enabled;
      };

      desktop = {
        qtile = enabled;
        login.sddm_chili = enabled;
      };
    };
  };
}

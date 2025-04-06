{
  namespace,
  lib,
  config,
  ...
}:
with lib;
with lib.mynix; let
  cfg = config.mynix.suites.desktop;
in {
  options.mynix.suites.desktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Desktop Config";
  };

  config = mkIf cfg.enable {
    mynix = {
      desktop = {
        qtile = enabled;
        login.sddm-chili = enabled;
      };
    };
  };
}

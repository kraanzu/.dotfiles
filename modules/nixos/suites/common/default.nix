{
  namespace,
  lib,
  config,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.suites.common;
in {
  options.${namespace}.suites.common.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Common Config";
  };

  config = mkIf cfg.enable {
    mynix = {
      system = {
        boot = enabled;
        fonts = enabled;
        locale = enabled;
        sound = enabled;
        misc = enabled;
        shell = enabled;
        usb = enabled;
        xkb = enabled;
      };
      apps = {
        brave = enabled;
      };
      desktop = {
        utilities = enabled;
      };
    };
  };
}

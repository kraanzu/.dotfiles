{
  namespace,
  lib,
  config,
  ...
}:
with lib;
with lib.mynix; let
  cfg = config.mynix.suites.common;
in {
  options.mynix.suites.common.enable = lib.mkOption {
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
      apps = {
        disk-utilities = enabled;
        droidcam = enabled;
      };
      cli = {
        protonvpn = enabled;
      };
    };
  };
}

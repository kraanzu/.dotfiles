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
      apps = {
        discord = enabled;
        vlc = enabled;
      };
    };
  };
}

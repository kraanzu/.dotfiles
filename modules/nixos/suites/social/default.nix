{
  namespace,
  lib,
  config,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.suites.social;
in {
  options.${namespace}.suites.desktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Social Suite";
  };

  config = mkIf cfg.enable {
    mynix = {
      social = {
        discord = enabled;
        telegram = enabled;
      };
    };
  };
}

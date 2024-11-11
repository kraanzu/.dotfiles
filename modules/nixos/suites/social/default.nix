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
  options.${namespace}.suites.social.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Social Suite";
  };

  config = mkIf cfg.enable {
    mynix = {
      apps = {
        discord = enabled;
        telegram = enabled;
      };
    };
  };
}

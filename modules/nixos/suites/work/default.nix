{
  namespace,
  lib,
  config,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.suites.work;
in {
  options.${namespace}.suites.work.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Work Suite";
  };

  config = mkIf cfg.enable {
    mynix = {
      apps = {
        slack = enabled;
        chrome = enabled;
      };
    };
  };
}

{
  namespace,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.suites.common;
in {
  options.${namespace}.suites.common.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable common suite";
  };

  config = lib.mkIf cfg.enable {
    ${namespace} = {
      apps = {
        firefox = enabled;
      };
      desktop = {
        wallpapers = enabled;
        nord_theme = enabled;
        mimeapps = enabled;
      };
    };
  };
}

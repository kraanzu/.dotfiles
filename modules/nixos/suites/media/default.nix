{
  namespace,
  lib,
  config,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.suites.media;
in {
  options.${namespace}.suites.media.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Media Suite";
  };

  config = mkIf cfg.enable {
    mynix = {
      apps = {
        vlc = enabled;
      };
    };
  };
}

{
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.mynix.tools.redshift;
in {
  options = {
    mynix.tools.redshift.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable redshift";
    };
  };
  config = lib.mkIf cfg.enable {
    services.redshift = {
      enable = true;
      temperature = {
        day = 4000;
        night = 4000;
      };
    };
  };
}

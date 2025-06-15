{

  lib,
  config,
  ...
}:
with lib;
with lib.mynix;
let
  cfg = config.mynix.suites.social;
in
{
  options.mynix.suites.social.enable = lib.mkOption {
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

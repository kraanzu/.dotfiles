{

  lib,
  config,
  ...
}:
with lib;
with lib.mynix;
let
  cfg = config.mynix.suites.work;
in
{
  options.mynix.suites.work.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Work Suite";
  };

  config = mkIf cfg.enable {
    mynix = {
      apps = {
        slack = enabled;
        chrome = enabled;
        postman = enabled;
        zoom = enabled;
        libreoffice = enabled;
      };
    };
  };
}

{
  config,
  lib,

  ...
}:
with lib;
let
  cfg = config.mynix.system.xkb;
in
{
  options.mynix.system.xkb.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Setup xkb";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      xkb = {
        layout = "us";
      };
    };
  };
}

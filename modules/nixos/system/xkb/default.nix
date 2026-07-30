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
  options.mynix.system.xkb.enable = lib.mynix.mkBoolOpt true "Setup xkb";

  config = mkIf cfg.enable {
    services.xserver = {
      xkb = {
        layout = "us";
      };
    };
  };
}

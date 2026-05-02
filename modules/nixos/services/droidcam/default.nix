{
  config,
  lib,

  ...
}:
with lib;
let
  cfg = config.mynix.services.droidcam;
in
{
  options.mynix.services.droidcam = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable droidcam";
    };
  };

  config = mkIf cfg.enable {
    programs.droidcam.enable = true;
  };
}

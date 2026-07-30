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
    enable = mkEnableOption "droidcam";
  };

  config = mkIf cfg.enable {
    programs.droidcam.enable = true;
  };
}

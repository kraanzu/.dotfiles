{
  config,
  lib,
  namespace,
  ...
}:
with lib; let
  cfg = config.mynix.apps.droidcam;
in {
  options.mynix.apps.droidcam = {
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

{
  config,
  lib,
  namespace,
  ...
}:
with lib; let
  cfg = config.mynix.tools.droidcam;
in {
  options.mynix.tools.droidcam = {
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

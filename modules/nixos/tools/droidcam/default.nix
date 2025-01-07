{
  config,
  lib,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.tools.droidcam;
in {
  options.${namespace}.tools.droidcam = {
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

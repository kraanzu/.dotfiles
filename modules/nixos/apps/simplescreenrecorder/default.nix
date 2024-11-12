{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.simplescreenrecorder;
in {
  options.${namespace}.apps.simplescreenrecorder = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable simplescreenrecorder";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.simplescreenrecorder];
  };
}

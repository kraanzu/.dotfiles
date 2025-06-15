{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.simplescreenrecorder;
in
{
  options.mynix.apps.simplescreenrecorder = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable simplescreenrecorder";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.simplescreenrecorder ];
  };
}

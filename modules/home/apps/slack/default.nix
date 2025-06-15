{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.slack;
in
{
  options.mynix.apps.slack = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable slack desktop";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.slack ];
  };
}

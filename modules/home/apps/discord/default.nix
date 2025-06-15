{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.discord;
in
{
  options.mynix.apps.discord = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable discord";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.discord ];
  };
}

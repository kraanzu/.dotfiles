{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.soptify;
in
{
  options.mynix.apps.soptify = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable soptify";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.spotify ];
  };
}

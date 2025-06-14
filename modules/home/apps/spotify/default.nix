{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.spotify;
in
{
  options.mynix.apps.spotify = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable spotify";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}

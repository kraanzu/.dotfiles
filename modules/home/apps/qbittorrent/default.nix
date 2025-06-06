{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.qbittorrent;
in
{
  options.mynix.apps.qbittorrent = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable qbittorrent";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.qbittorrent ];
  };
}

{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.qbittorrent;
in {
  options.${namespace}.apps.qbittorrent = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable qbittorrent";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.qbittorrent];
  };
}

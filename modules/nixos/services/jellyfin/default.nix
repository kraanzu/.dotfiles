{
  config,
  lib,
  ...
}:
let
  cfg = config.mynix.services.jellyfin;
in
{
  options.mynix.services.jellyfin = {
    enable = lib.mkEnableOption "Jellyfin media server";
    openFirewall = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = cfg.openFirewall;
    };
    users.users.jellyfin.extraGroups = [ "video" "render" ];
  };
}

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
    openFirewall = lib.mynix.mkBoolOpt' true;
  };

  config = lib.mkIf cfg.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = cfg.openFirewall;
    };
    users.users.jellyfin.extraGroups = [ "video" "render" ];
  };
}

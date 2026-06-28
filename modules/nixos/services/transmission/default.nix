{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.mynix;
let
  cfg = config.mynix.services.transmission;
in
{
  options.mynix.services.transmission = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable transmission daemon";
    };
  };

  config = mkIf cfg.enable {
    services.transmission = {
      enable = true;
      package = pkgs.transmission_4-gtk;
      openRPCPort = true;
      user = "kraanzu";
      home = "/home/kraanzu";
      settings = {
        rpc-bind-address = "127.0.0.1";
        rpc-port = 9091;
        ratio-limit = 0;
        ratio-limit-enabled = true;
        script-torrent-done-enabled = true;
        script-torrent-done-filename = toString (
          pkgs.writeShellScript "torrent-done" ''
            export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u kraanzu)/bus"
            ${pkgs.libnotify}/bin/notify-send "Torrent done" "$TR_TORRENT_NAME"
            ${pkgs.transmission_4}/bin/transmission-remote --torrent "$TR_TORRENT_ID" --remove
          ''
        );
      };
    };

    users.users.kraanzu.extraGroups = [
      "tranmission"
    ];
  };
}

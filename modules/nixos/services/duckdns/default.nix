{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mynix.services.duckdns;
  acmeEnvFile = pkgs.writeText "duckdns-acme.env" ''
    DUCKDNS_TOKEN=${builtins.readFile cfg.tokenFile}
  '';
in
{
  options.mynix.services.duckdns = {
    enable = lib.mkEnableOption "DuckDNS dynamic DNS updater";
    domain = lib.mkOption {
      type = lib.types.str;
      description = "DuckDNS subdomain (without .duckdns.org).";
    };
    tokenFile = lib.mkOption {
      type = lib.types.path;
      default = ./token.secret;
      description = "Path to a file containing the DuckDNS token.";
    };
    acmeCredentialsFile = lib.mkOption {
      type = lib.types.path;
      default = acmeEnvFile;
      internal = true;
      description = "Generated env file for ACME DNS challenge.";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.duckdns = {
      description = "Update DuckDNS";
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      serviceConfig = {
        Type = "oneshot";
        DynamicUser = true;
      };
      script = ''
        ${pkgs.curl}/bin/curl -s "https://www.duckdns.org/update?domains=${cfg.domain}&token=$(cat ${cfg.tokenFile})&ip="
      '';
    };

    systemd.timers.duckdns = {
      description = "Update DuckDNS every 5 minutes";
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "1min";
        OnUnitActiveSec = "5min";
      };
    };
  };
}

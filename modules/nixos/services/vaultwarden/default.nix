{
  config,
  lib,
  ...
}:
let
  cfg = config.mynix.services.vaultwarden;
in
{
  options.mynix.services.vaultwarden = {
    enable = lib.mkEnableOption "Vaultwarden password manager";
    openFirewall = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    services.vaultwarden = {
      enable = true;
      config = {
        ROCKET_ADDRESS = "0.0.0.0";
        ROCKET_PORT = 8222;
        SIGNUPS_ALLOWED = true;
      };
    };

    networking.firewall.allowedTCPPorts = lib.mkIf cfg.openFirewall [ 8222 ];
  };
}

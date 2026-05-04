{
  config,
  lib,
  ...
}:
let
  cfg = config.mynix.services.tailscale;
in
{
  options.mynix.services.tailscale = {
    enable = lib.mkEnableOption "Tailscale VPN";
  };

  config = lib.mkIf cfg.enable {
    services.tailscale.enable = true;

    networking.firewall = {
      trustedInterfaces = [ "tailscale0" ];
      allowedUDPPorts = [ config.services.tailscale.port ];
    };
  };
}

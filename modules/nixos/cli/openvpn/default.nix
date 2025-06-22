{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mynix.cli.openvpn;
in
{
  options = {
    mynix.cli.openvpn.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable OpenVPN";
    };
  };

  config = lib.mkIf cfg.enable {
    boot.kernelModules = [ "tun" ];

    services.openvpn.servers = {
      sp_htb = {
        config = builtins.readFile ./sp_htb.ovpn;
        autoStart = false;
      };
      lab_htb = {
        config = builtins.readFile ./lab_htb.ovpn;
        autoStart = false;
      };
    };

    environment.systemPackages = [ pkgs.openvpn ];

  };
}

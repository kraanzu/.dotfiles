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
    environment.etc.openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";

    services.openvpn.servers = {
      sp_htb = {
        config = builtins.readFile ./sp_htb.ovpn;
        autoStart = false;
      };
      lab_htb = {
        config = builtins.readFile ./lab_htb.ovpn;
        autoStart = false;
      };
      proton = {
        config = builtins.readFile ./proton.ovpn;
        authUserPass = builtins.toString ./proton.secret;
        autoStart = false;
        updateResolvConf = false;
      };
    };

    environment.systemPackages = [ pkgs.openvpn ];

  };
}

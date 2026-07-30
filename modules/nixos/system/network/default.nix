{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mynix.system.network;
in
{
  options.mynix.system.network.enable = lib.mynix.mkBoolOpt true "Setup network stuff";

  config = lib.mkIf cfg.enable {

    networking.networkmanager = {
      enable = true;
      # plugins = [ pkgs.networkmanager-openvpn ];
    };

    users.users.${config.mynix.user.name}.extraGroups = [ "networkmanager" ];
    networking.resolvconf.enable = false;
    environment.etc."resolv.conf".text = ''
      nameserver 8.8.8.8
      nameserver 8.8.4.4
    '';
  };
}

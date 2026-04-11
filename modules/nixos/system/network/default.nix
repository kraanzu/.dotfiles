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
  options.mynix.system.network.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Setup network stuff";
  };

  config = lib.mkIf cfg.enable {

    networking.networkmanager = {
      enable = true;
      # plugins = [ pkgs.networkmanager-openvpn ];
    };

    users.users.kraanzu.extraGroups = [ "networkmanager" ];
    environment.etc."resolv.conf".text = ''
      nameserver 8.8.8.8
      nameserver 8.8.4.4
    '';
  };
}

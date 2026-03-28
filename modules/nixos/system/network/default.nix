{
  lib,
  config,
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
    networking.networkmanager.enable = true;
    environment.etc."resolv.conf".text = ''
      nameserver 8.8.8.8
      nameserver 8.8.4.4
    '';

  };
}

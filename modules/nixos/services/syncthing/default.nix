{
  config,
  lib,
  ...
}:
let
  cfg = config.mynix.services.syncthing;
in
{
  options.mynix.services.syncthing = {
    enable = lib.mkEnableOption "Syncthing";
  };

  config = lib.mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      user = config.mynix.user.name;
      dataDir = "/home/${config.mynix.user.name}";
      openDefaultPorts = true;
    };
  };
}

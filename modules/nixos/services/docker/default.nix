{
  config,
  lib,
  ...
}:
let
  cfg = config.mynix.services.docker;
in
{
  options.mynix.services.docker.enable = lib.mynix.mkBoolOpt true "Enable Docker";

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = false;
      liveRestore = false;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    systemd.user.services.docker.wantedBy = lib.mkForce [ ];
  };
}

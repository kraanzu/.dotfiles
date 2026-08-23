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
    virtualisation.podman.enable = true;
    virtualisation.podman.dockerCompat = true;
  };
}

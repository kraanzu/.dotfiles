{
  config,
  lib,
  ...
}:
let
  cfg = config.mynix.cli.docker;
in
{
  options = {
    mynix.cli.docker.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Docker";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      liveRestore = false;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}

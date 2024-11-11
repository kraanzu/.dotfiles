{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.tools.docker;
in {
  options = {
    ${namespace}.tools.docker.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Docker";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker.enable = true;
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}

{
  config,
  lib,
  ...
}: {
  options = {
    mynix.dev.tools.docker.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Docker";
    };
  };

  config = lib.mkIf config.mynix.dev.tools.docker.enable {
    virtualisation.docker.enable = true;
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}

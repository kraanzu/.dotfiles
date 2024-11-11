{
  config,
  lib,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.system.xkb;
in {
  options.${namespace}.system.xkb.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Setup xkb";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      xkb = {
        layout = "us";
      };
    };
  };
}

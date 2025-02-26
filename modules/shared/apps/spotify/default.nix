{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.soptify;
in {
  options.${namespace}.apps.soptify = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable soptify";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.spotify];
  };
}

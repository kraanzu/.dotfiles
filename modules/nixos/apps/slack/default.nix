{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.slack;
in {
  options.${namespace}.apps.slack = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable slack desktop";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.slack];
  };
}

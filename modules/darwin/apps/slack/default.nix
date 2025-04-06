{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.mynix.apps.slack;
in {
  options.mynix.apps.slack = {
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

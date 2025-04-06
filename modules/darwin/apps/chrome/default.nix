{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.mynix.apps.chrome;
in {
  options.mynix.apps.chrome = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable google chrome";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.google-chrome];
  };
}

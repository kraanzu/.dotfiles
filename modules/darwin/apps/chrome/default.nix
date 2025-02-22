{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.chrome;
in {
  options.${namespace}.apps.chrome = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable google chrome";
    };
  };

  config = mkIf cfg.enable {
    homebrew.casks = [ "google-chrome" ];
  };
}

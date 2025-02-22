{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.discord;
in {
  options.${namespace}.apps.discord = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable discord";
    };
  };

  config = mkIf cfg.enable {
    homebrew.casks = [ "discord" ];
  };
}

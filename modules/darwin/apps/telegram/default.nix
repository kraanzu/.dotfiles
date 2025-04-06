{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.telegram;
in {
  options.${namespace}.apps.telegram = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable telegram";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.telegram-desktop];
  };
}

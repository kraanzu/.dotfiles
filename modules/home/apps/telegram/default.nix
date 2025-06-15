{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.telegram;
in
{
  options.mynix.apps.telegram = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable telegram";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.telegram-desktop ];
  };
}

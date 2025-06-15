{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.libreoffice;
in
{
  options.mynix.apps.libreoffice = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable libreoffice";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.libreoffice ];
  };
}

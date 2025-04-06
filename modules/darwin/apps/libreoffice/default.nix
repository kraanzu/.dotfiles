{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.mynix.apps.libreoffice;
in {
  options.mynix.apps.libreoffice = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable libreoffice";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.libreoffice];
  };
}

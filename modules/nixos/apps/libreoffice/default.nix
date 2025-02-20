{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.libreoffice;
in {
  options.${namespace}.apps.libreoffice = {
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

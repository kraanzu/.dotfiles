{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.tools.disk-utilities;
in {
  options = {
    ${namespace}.tools.disk-utilities.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Disk Utilities";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gnome-disk-utility
      ntfs3g
      gparted
    ];
  };
}

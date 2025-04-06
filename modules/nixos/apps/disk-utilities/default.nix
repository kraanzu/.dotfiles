{
  pkgs,
  lib,
  config,

  ...
}:
let
  cfg = config.mynix.apps.disk-utilities;
in
{
  options = {
    mynix.apps.disk-utilities.enable = lib.mkOption {
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

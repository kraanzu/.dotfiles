{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
with lib.mynix;

let
  cfg = config.mynix.utils;
in
{
  options.mynix.utils = {
    all.enable = mkBoolOpt true "Enable all apps";

    disks.enable = mkBoolOpt false "Enable disk utilities";
    libreoffice.enable = mkBoolOpt false "Enable LibreOffice";
    gdrive.enable = mkBoolOpt false "Enable Google Drive (gdrive3)";

  };

  config = {
    home.packages = with pkgs; [
      (mkIf (cfg.disks.enable || cfg.all.enable) gparted)
      (mkIf (cfg.disks.enable || cfg.all.enable) ntfs3g)
      (mkIf (cfg.disks.enable || cfg.all.enable) gnome-disk-utility)

      (mkIf (cfg.libreoffice.enable || cfg.all.enable) libreoffice)
      (mkIf (cfg.gdrive.enable || cfg.all.enable) gdrive3)
    ];
  };
}

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
  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/libreoffice/default.nix") ];
  # config = mkIf cfg.enable {
  #   homebrew.casks = [ "libreoffice" ];
  # };
}

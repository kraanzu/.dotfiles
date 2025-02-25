{
  pkgs,
  namespace,
  lib,
  config,
  ...
}: let
  cfg = config.${namespace}.system.fonts;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/anydesk/default.nix") ];
}
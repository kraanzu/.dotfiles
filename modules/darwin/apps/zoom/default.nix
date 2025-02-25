{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.zoom;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/zoom/default.nix") ];
}

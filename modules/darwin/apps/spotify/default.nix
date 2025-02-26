{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.soptify;
in {

  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/spotify/default.nix") ];
}

{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.zed;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/zed/default.nix") ];
}

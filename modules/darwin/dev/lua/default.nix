{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.lang.lua;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/dev/lua/default.nix") ];
}

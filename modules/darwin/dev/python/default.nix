{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.lang.python;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/dev/nix/python.nix") ];
}

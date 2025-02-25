{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.lang.nix;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/dev/nix/default.nix") ];
}

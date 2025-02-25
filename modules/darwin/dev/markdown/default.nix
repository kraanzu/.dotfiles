{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.lang.markdown;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/dev/markdown/default.nix") ];
}

{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.cli.gdrive;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/cli/gdrive/default.nix") ];
}

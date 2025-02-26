{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.apps.vscode;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/vscode/default.nix") ];
}
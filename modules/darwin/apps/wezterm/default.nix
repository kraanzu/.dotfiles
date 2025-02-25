{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.apps.wezterm;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/wezterm/default.nix") ];
}
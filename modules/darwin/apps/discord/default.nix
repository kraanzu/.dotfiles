{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.discord;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/discord/default.nix") ];
}
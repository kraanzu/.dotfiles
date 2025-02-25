{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.anydesk;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/anydesk/default.nix") ];
}

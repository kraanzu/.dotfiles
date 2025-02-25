{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.postman;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/postman/default.nix") ];
  # config = mkIf cfg.enable {
  #   homebrew.casks = [ "postman" ];
  # };
}

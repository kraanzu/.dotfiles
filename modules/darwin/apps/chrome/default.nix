{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.chrome;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/chrome/default.nix") ];

  # config = mkIf cfg.enable {
  #   homebrew.casks = [ "google-chrome" ];
  # };
}

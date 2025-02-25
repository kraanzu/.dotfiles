{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.slack;
in {
  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/slack/default.nix") ];
  # config = mkIf cfg.enable {
  #   homebrew.casks = [ "slack" ];
  # };
}

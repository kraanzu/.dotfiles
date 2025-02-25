{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.soptify;
in {

  imports = [ (lib.snowfall.fs.get-file "modules/shared/apps/spotify/default.nix") ];
  options.${namespace}.apps.soptify = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable soptify";
    };
  };

  config = mkIf cfg.enable {
    homebrew.casks = [ "soptify" ];
  };
}

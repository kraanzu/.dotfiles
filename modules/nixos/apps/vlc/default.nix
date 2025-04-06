{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.mynix; let
  cfg = config.mynix.apps.vlc;
in {
  options.mynix.apps.vlc = with types; {
    enable = mkBoolOpt false "Whether or not to enable vlc.";
  };

  config = mkIf cfg.enable {environment.systemPackages = with pkgs; [vlc];};
}

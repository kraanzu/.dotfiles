{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
with lib.mynix;

let
  cfg = config.mynix.games;
in
{
  options.mynix.games = {
    mindustry.enable = mkBoolOpt false "Add Mindustry";
  };

  config = {
    home.packages = with pkgs; [
      (mkIf (cfg.mindustry.enable) stable.mindustry-wayland)
    ];
  };
}

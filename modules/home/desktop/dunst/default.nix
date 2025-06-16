{
  lib,
  pkgs,
  config,

  ...
}:
let
  cfg = config.mynix.desktop.dunst;
in
{
  options.mynix.desktop.dunst.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable dunst";
  };

  config = lib.mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    home.packages = with pkgs; [
      dunst
      libnotify
    ];
  };
}

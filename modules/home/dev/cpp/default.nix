{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.cpp;
in
{
  options = {
    mynix.dev.cpp.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup cpp stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gcc
    ];
  };
}

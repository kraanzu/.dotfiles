{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.lang.cpp;
in
{
  options = {
    mynix.dev.lang.cpp.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup cpp stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gcc
    ];
  };
}

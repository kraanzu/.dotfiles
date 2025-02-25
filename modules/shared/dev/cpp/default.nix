{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.lang.cpp;
in {
  options = {
    ${namespace}.dev.lang.cpp.enable = lib.mkOption {
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

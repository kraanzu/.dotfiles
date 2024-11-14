{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.lang.go;
in {
  options = {
    mynix.dev.lang.rust.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup rust stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # lang
      rustup
    ];
  };
}

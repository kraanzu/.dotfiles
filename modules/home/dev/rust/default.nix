{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.go;
in
{
  options = {
    mynix.dev.rust.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup rust stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      rustup
    ];
  };
}

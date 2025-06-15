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
    mynix.dev.go.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup go stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      go
      gopls
      delve
      gdlv
    ];
  };
}

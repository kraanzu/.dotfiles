{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.zig;
in
{
  options = {
    mynix.dev.zig.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup zig stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      zig
      zls
    ];
  };
}

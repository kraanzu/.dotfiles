{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.lang.zig;
in
{
  options = {
    mynix.dev.lang.zig.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup zig stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # lang
      zig

      # lsp
      zls
    ];
  };
}

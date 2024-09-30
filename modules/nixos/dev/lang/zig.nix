{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mynix.dev.lang.zig.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Setup zig stuff";
    };
  };

  config = lib.mkIf config.mynix.dev.lang.zig.enable {
    environment.systemPackages = with pkgs; [
      # lang
      zig

      # lsp
      zls
    ];
  };
}

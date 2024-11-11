{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.lang.zig;
in {
  options = {
    ${namespace}.dev.lang.zig.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Setup zig stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # lang
      zig

      # lsp
      zls
    ];
  };
}

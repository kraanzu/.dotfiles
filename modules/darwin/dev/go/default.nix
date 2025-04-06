{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.lang.go;
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
    environment.systemPackages = with pkgs; [
      # lang
      go

      # lsp
      gopls
    ];
  };
}

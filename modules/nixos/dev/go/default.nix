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
    ${namespace}.dev.lang.go.enable = lib.mkOption {
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

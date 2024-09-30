{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mynix.dev.lang.go.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Setup go stuff";
    };
  };

  config = lib.mkIf config.mynix.dev.lang.go.enable {
    environment.systemPackages = with pkgs; [
      # lang
      go

      # lsp
      gopls
    ];
  };
}

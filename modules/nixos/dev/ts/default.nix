{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.mynix.dev.lang.ts;
in {
  options = {
    mynix.dev.lang.ts.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup Typescript stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # lang
      typescript

      #lsp
      typescript-language-server

      # formatter
      prettierd

      bun
    ];
  };
}

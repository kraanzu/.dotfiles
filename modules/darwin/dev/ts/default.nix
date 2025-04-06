{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.lang.ts;
in
{
  options = {
    mynix.dev.ts.enable = lib.mkOption {
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

{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mynix.dev.lang.ts.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Setup Typescript stuff";
    };
  };

  config = lib.mkIf config.mynix.dev.lang.ts.enable {
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

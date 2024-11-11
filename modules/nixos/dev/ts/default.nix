{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.lang.ts;
in {
  options = {
    ${namespace}.dev.lang.ts.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
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

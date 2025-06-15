{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.ts;
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
    home.packages = with pkgs; [
      typescript
      typescript-language-server
      prettierd
      bun
    ];
  };
}

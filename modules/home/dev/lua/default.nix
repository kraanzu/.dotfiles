{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.lang.lua;
in
{
  options = {
    mynix.dev.lang.lua.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup lua stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # lang
      lua

      # lsp
      luajitPackages.lua-lsp

      # formatter
      stylua
    ];
  };
}

{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.lua;
in
{
  options = {
    mynix.dev.lua.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup lua stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      lua
      luajitPackages.lua-lsp
      stylua
    ];
  };
}

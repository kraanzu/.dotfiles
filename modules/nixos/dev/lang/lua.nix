{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mynix.dev.lang.lua.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup lua stuff";
    };
  };

  config = lib.mkIf config.mynix.dev.lang.lua.enable {
    environment.systemPackages = with pkgs; [
      # lang
      lua

      # lsp
      luajitPackages.lua-lsp

      # formatter
      stylua
    ];
  };
}

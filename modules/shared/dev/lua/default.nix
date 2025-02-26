{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.lua;
in {
  options = {
    ${namespace}.dev.lua.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup lua stuff";
    };
  };

  config = lib.mkIf cfg.enable {
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

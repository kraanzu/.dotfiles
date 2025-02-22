{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.tools.code-cursor;
in {
  options = {
    ${namespace}.tools.code-cursor.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Cursor IDE";
    };
  };
  config = lib.mkIf cfg.enable {
    homebrew.casks = ["cursor"];
  };
}

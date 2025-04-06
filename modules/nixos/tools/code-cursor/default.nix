{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.mynix.tools.code-cursor;
in {
  options = {
    mynix.tools.code-cursor.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Cursor IDE";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      code-cursor
    ];
  };
}

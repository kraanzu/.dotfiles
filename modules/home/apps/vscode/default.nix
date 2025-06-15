{
  pkgs,
  lib,
  config,

  ...
}:
let
  cfg = config.mynix.apps.vscode;
in
{
  options = {
    mynix.apps.vscode.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable VSCode";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      vscode
    ];
  };
}

{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.mynix.tools.vscode;
in {
  options = {
    mynix.tools.vscode.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable VSCode";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vscode
    ];
  };
}

{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.apps.vscode;
in {
  options = {
    ${namespace}.apps.vscode.enable = lib.mkOption {
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

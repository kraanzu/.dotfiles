{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.mynix.cli.gdrive;
in {
  options = {
    mynix.cli.gdrive.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Google Drive CLI";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gdrive3
    ];
  };
}

{
  pkgs,
  lib,
  config,

  ...
}:
let
  cfg = config.mynix.cli.gdrive;
in
{
  options = {
    mynix.cli.gdrive.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Google Drive CLI";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gdrive3
    ];
  };
}

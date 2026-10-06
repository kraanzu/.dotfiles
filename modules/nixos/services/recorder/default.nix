{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mynix.services.recorder;
in
{
  options.mynix.services.recorder.enable = lib.mkEnableOption "Enable screen recorder";

  config = lib.mkIf cfg.enable {
    hardware.graphics.enable = true;

    programs.gpu-screen-recorder.enable = true;

    environment.systemPackages = [ pkgs.gpu-screen-recorder-gtk ];
  };
}

{
  config,
  lib,

  ...
}:
with lib;
let
  cfg = config.mynix.hardware.amdgpu;
in
{
  options.mynix.hardware.amdgpu.enable = lib.mkEnableOption "AMD GPU";

  config = mkIf cfg.enable {
    boot.initrd.kernelModules = [ "amdgpu" ];
    services.xserver.videoDrivers = [ "amdgpu" ];
  };
}

{
  config,
  lib,
  namespace,
  ...
}:
with lib; let
  cfg = config.mynix.hardware.amdgpu;
in {
  options = {
    mynix.hardware.amdgpu.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable AMD GPU";
    };
  };

  config = mkIf cfg.enable {
    boot.initrd.kernelModules = ["amdgpu"];
    services.xserver.videoDrivers = ["amdgpu"];
  };
}

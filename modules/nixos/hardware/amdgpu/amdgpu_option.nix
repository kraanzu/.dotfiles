{
  config,
  lib,
  ...
}:
with lib; {
  options = {
    mynix.hardware.amdgpu.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable AMD GPU";
    };
  };

  config = mkIf config.mynix.hardware.amdgpu.enable {
    boot.initrd.kernelModules = ["amdgpu"];
    services.xserver.videoDrivers = ["amdgpu"];
  };
}

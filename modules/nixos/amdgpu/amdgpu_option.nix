{
  config,
  lib,
  ...
}:
with lib;
{
  options = {
    mynix.amdgpu.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable AMD GPU";
    };
  };

  config = mkIf config.mynix.amdgpu.enable {
    boot.initrd.kernelModules = ["amdgpu"];
    services.xserver.videoDrivers = ["amdgpu"];
  };
}


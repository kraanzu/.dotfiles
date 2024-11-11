{
  config,
  lib,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.hardware.amdgpu;
in {
  options = {
    ${namespace}.hardware.amdgpu.enable = lib.mkOption {
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

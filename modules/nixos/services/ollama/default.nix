{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mynix.services.ollama;
  gfxVersion = "10.3.0"; # rx6650xt
in
{
  options = {
    mynix.services.ollama.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Ollama";
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics.extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];

    hardware.amdgpu.opencl.enable = true;

    services.ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      rocmOverrideGfx = gfxVersion;
      environmentVariables = {
        HSA_OVERRIDE_GFX_VERSION = gfxVersion;
      };
    };
  };
}

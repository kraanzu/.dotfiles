{
  pkgs,

  lib,
  config,
  ...
}:
let
  cfg = config.mynix.system.sound;
in
{
  options.mynix.system.sound.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Setup sound";
  };

  config = lib.mkIf cfg.enable {
    services.pulseaudio.enable = false;

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          AutoEnable = true;
          RememberDevice = true;
        };
      };
    };

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}

{
  pkgs,
  namespace,
  lib,
  config,
  ...
}: let
  cfg = config.${namespace}.system.sound;
in {
  options.${namespace}.system.sound.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Setup sound";
  };

  config = lib.mkIf cfg.enable {
    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };
}

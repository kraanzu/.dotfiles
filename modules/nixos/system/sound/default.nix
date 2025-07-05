{
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
      audio.enable = true;
      pulse.enable = true;
      alsa.enable = true;

      wireplumber.enable = true;
      wireplumber.extraConfig = {
        "rename-sinks" = {
          "monitor.alsa.rules" = [
            {
              matches = [
                { "node.name" = "alsa_output.pci-0000_0a_00.1.hdmi-stereo-extra1"; }
              ];
              actions.update-props = {
                "node.description" = "Monitor HDMI";
                "device.form-factor" = "hdmi";
              };
            }

            {
              matches = [
                { "node.name" = "alsa_output.usb-ACTIONS_Pebble_V3-00.analog-stereo"; }
              ];
              actions.update-props = {
                "node.description" = "Pebble V3";
                "device.form-factor" = "speakers";
              };
            }

            {
              matches = [
                { "node.name" = "alsa_output.pci-0000_0c_00.4.iec958-stereo"; }
              ];
              actions.update-props = {
                "node.description" = "Internal HDMI";
                "device.form-factor" = "internal";
              };
            }
          ];
        };
      };
    };
  };
}

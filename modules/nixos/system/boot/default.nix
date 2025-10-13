{

  lib,
  config,
  ...
}:
let
  cfg = config.mynix.system.boot;
in
{
  options.mynix.system.boot.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable boot configuration.";
  };

  config = lib.mkIf cfg.enable {
    boot.loader.systemd-boot.enable = false;

    swapDevices = [ { device = "/dev/nvme1n1p4"; } ];
    boot.resumeDevice = "/dev/nvme1n1p4";
    boot.plymouth.enable = true;
    boot.consoleLogLevel = 0;
    boot.kernelParams = [
      "quiet"
      "splash"
      "nowatchdog"
    ];

    boot.loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      grub2-theme = {
        enable = true;
        theme = "vimix";
        footer = true;
      };

      grub = {
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        # efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
      };
    };
    systemd.user.extraConfig = ''
      DefaultTimeoutStopSec=5s
    '';
  };
}

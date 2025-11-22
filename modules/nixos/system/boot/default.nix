{

  lib,
  config,
  pkgs,
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
    environment.systemPackages = [ pkgs.grub2 ];

    boot.loader.systemd-boot.enable = false;
    boot.plymouth.enable = true;
    boot.consoleLogLevel = 0;
    boot.initrd.verbose = false;
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
      };
    };
    systemd.user.extraConfig = ''
      DefaultTimeoutStopSec=3s
    '';

    security.sudo.extraRules = [
      {
        users = [ "kraanzu" ];
        commands = [
          {
            command = "/run/current-system/sw/bin/grub-reboot";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}

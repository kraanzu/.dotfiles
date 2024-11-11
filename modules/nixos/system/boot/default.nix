{
  namespace,
  lib,
  config,
  ...
}: let
  cfg = config.${namespace}.system.boot;
in {
  options.${namespace}.system.boot.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable boot configuration.";
  };

  config = lib.mkIf cfg.enable {
    boot.loader.systemd-boot.enable = false;
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
  };
}

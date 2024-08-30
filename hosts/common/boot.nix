{
  boot.loader.systemd-boot.enable = false;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      useOSProber = true;
      efiSupport = true;
      device = "nodev";
      # efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
    };
  };
}

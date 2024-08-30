{inputs, ... }:{
  imports = [inputs.grub2-themes.nixosModules.default];

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
}

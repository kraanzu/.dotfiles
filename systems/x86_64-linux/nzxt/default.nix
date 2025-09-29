{ lib, ... }:
with lib;
with lib.mynix;
{
  imports = [
    ./hardware-configuration.nix
    ./htb.nix
    ./monitors.nix
    ./drives.nix
  ];

  hardware.openrazer = {
    enable = true;
    batteryNotifier = {
      percentage = 5;
      frequency = 6 * 3600;
    };
  };

  networking.hostName = "nzxt";
  mynix = {
    apps = {
      openrgb = enabled;
    };
    desktop = {
      qtile = enabled;
      login = enabled;
      utilities = enabled;
    };
    hardware = {
      amdgpu = enabled;
    };
  };

  programs.coolercontrol.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  users.users.kraanzu = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
      "openrazer"
    ];
  };

  system.stateVersion = "24.11";
}

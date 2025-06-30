{ lib, ... }:
with lib;
with lib.mynix;
let
in
{
  imports = [
    ./hardware-configuration.nix
    ./htb.nix
    ./monitors.nix
  ];

  # Extra fluff
  hardware.openrazer = {
    enable = true;
    batteryNotifier = {
      percentage = 5;
      frequency = 6 * 3600;
    };
  };
  fileSystems."/drives/WIN10" = {
    device = "/dev/disk/by-uuid/54E0DD9BE0DD83A0";
    fsType = "ntfs";
  };

  networking.hostName = "nzxt";
  mynix = {
    apps = {
      openrgb = enabled;
    };
    desktop = {
      qtile = enabled;
      login.sddm-chili = enabled;
      utilities = enabled;
    };
    hardware = {
      amdgpu = enabled;
    };
  };

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

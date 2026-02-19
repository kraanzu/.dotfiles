{ lib, ... }:
with lib;
with lib.mynix;
{
  imports = [
    ./hardware-configuration.nix
    ./htb.nix
    ./drives.nix
  ];

  networking.hostName = "nzxt";
  mynix = {
    apps.openrgb = enabled;
    desktop.hyprland = enabled;
    hardware.amdgpu = enabled;
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

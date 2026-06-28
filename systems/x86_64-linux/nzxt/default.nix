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
    services = {
      openrgb = enabled;
      jellyfin = enabled;
      tailscale = enabled;
      transmission = enabled;
      vaultwarden = enabled;
      razer = enabled;
    };
    desktop.hyprland = enabled;
    hardware.amdgpu = enabled;
  };

  users.users.kraanzu = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };

  system.stateVersion = "24.11";
}

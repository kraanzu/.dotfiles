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

  networking.hostName = "nzxt";
  hardware.openrazer = {
    enable = true;
    batteryNotifier.percentage = 10;
  };

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

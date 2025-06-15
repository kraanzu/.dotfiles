{ lib, ... }:
with lib;
with lib.mynix;
let
in
{
  imports = [
    ./hardware-configuration.nix
    ./ext_drives.nix
    ./monitors.nix
  ];

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
    ];
  };

  system.stateVersion = "24.11";
}

{
  lib,

  ...
}:
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
    archetypes = {
      workstation = enabled;
    };
    suites = {
      work = enabled;
    };
    hardware = {
      amdgpu = enabled;
    };
    apps = {
      openrgb = enabled;
    };
  };

  services.getty.autologinUser = "kraanzu";
  services.displayManager.autoLogin = {
    enable = true;
    user = "kraanzu";
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

{
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
in {
  imports = [
    ./hardware-configuration.nix
    ./ext_drives.nix
    ./work.nix
    ./monitors.nix
  ];

  networking.hostName = "nzxt";

  ${namespace} = {
    archetypes = {
      workstation = enabled;
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
    extraGroups = ["networkmanager" "wheel" "adbusers"];
  };

  system.stateVersion = "24.11";
}

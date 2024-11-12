{
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
in {
  imports = [
    ./hardware-configuration.nix
    ./ext_drives.nix
    ./work.nix # work stuff
    ./monitors.nix
  ];

  networking.hostName = "nzxt";

  mynix = {
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
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "adbusers"];
  };
}

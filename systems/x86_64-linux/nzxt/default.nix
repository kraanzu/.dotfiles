{
  pkgs,
  ...
}: {
  imports = [
    ./common
    ./packages

    ./hardware-configuration.nix
    ./ext_drives.nix
    ./tempwork.nix # temp stuff for gigs
    ./office.nix # work stuff
    ./monitors.nix
  ];

  networking.hostName = "nzxt";

  # drivers
  mynix.hardware.amdgpu.enable = true;

  # eye candy
  mynix.sddm_chili.enable = true;
  mynix.services.openrgb = {
    enable = true;
    profile = "purple";
  };

  # WMs
  mynix.wm.qtile.enable = true;
  # mynix.wm.hyprland.enable = true;

  services.getty.autologinUser = "kraanzu";
  services.displayManager.autoLogin = {
    enable = true;
    user = "kraanzu";
  };

  users.users.kraanzu = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel"];
  };
}

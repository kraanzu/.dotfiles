{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../common
    ./packages

    ./hardware-configuration.nix
    ./ext_drives.nix
    ./tempwork.nix # temp stuff for gigs
  ];

  networking.hostName = "nzxt";

  # drivers
  mynix.amdgpu.enable = true;

  # eye candy
  mynix.sddm_chili.enable = true;

  # WMs
  mynix.wm.qtile.enable = true;

  services.hardware.openrgb.enable = true;

  users.users.kraanzu = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel"];
  };
}

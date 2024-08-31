{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../common
    ./hardware-configuration.nix
    ./ext_drives.nix
    ./tempwork.nix # temp stuff for gigs
  ];

  networking.hostName = "nixos";

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
    description = "kraanzu";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
    ];
  };
}

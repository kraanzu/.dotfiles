{
pkgs,
inputs,
...
}:
{
  imports = [
  ../common/global
  ./hardware-configuration.nix
  ./ext_drives.nix
  ];

  networking.hostName = "nixos";
  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.videoDrivers = ["amdgpu"];

  services.displayManager.sddm = {
    enable = true;
  };

  services.xserver.windowManager.qtile = {
    enable = true;
    backend = "x11";
    extraPackages = p: with p; [qtile-extras];
  };

  programs.hyprland.enable = true;

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

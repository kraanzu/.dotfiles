# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "nixos"; # Define your hostname.

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

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["SourceCodePro"];})
  ];
  services.redshift = {
    enable = true;
    temperature = {
      day = 4000;
      night = 4000;
    };
  };
  system.stateVersion = "24.05"; # Did you read the comment?
}

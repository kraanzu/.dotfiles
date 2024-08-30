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
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # services.lorri.enable = true;

  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];
  services.picom = {
    enable = true;
    vSync = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  services.displayManager.sddm = {
    enable = true;
  };

  services.xserver.windowManager.qtile = {
    enable = true;
    backend = "x11";
    extraPackages = p: with p; [qtile-extras];
  };

  programs.hyprland.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  # shell
  programs.fish.enable = true;
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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

  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = ["nix-command" "flakes"];
}

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

let 
 sddm_theme = "${import ./sddm_theme.nix {inherit pkgs;}}";
 grub_theme = "${import ./grub_theme.nix {inherit pkgs;}}";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = false;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
    theme = "${grub_theme}"; 
    useOSProber = true;
       efiSupport = true;
       #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
       device = "nodev";
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.displayManager.sddm = {
   enable=true;
   theme="${sddm_theme}";
  };

  services.xserver.windowManager.qtile = {
        enable = true;
        backend = "x11";
        extraPackages = python3Packages: with python3Packages; [
          (qtile-extras.overridePythonAttrs(old: { disabledTestPaths = [ "test/widget/*" ]; }))
        ];
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  # shell
  programs.fish.enable = true;
	
  users.users.kraanzu = {
    isNormalUser = true;
    shell=pkgs.fish;
    description = "kraanzu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    killall
    wget
    git
    htop
    wezterm
    fish
    qtile
    redshift
    rofi
    dunst
    source-code-pro
    os-prober
    geoclue2
    starship
    neovim
    eza
    xfce.thunar
    unzip
    zip
    xclip
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    nodejs_22
    ripgrep
    flameshot
    pulseaudio
    python311Packages.ipython
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
  ];

  services.geoclue2.enable=true;
  # services.redshift = {
  # enable = true;
  # latitude = 22.572645;
  # longitude = 88.363892;
  # };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
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

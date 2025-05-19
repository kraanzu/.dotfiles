{lib, ...}:
with lib;
with lib.mynix; let
in {
  imports = [
    ./hardware-configuration.nix
    ./ext_drives.nix
    ./monitors.nix
  ];

  networking.hostName = "nzxt";

  mynix = {
    suites = {
      work = enabled;
      common = enabled;
      desktop = enabled;
      development = enabled;
      social = enabled;
      media = enabled;
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

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
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

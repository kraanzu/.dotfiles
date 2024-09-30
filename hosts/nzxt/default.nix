{
  packages,
  pkgs,
  ...
}: {
  imports = [
    ../common
    ./packages

    ./hardware-configuration.nix
    ./ext_drives.nix
    ./tempwork.nix # temp stuff for gigs
    ./office.nix # work stuff
    ./monitors.nix
  ];

  environment.systemPackages = with packages; [cursor dooit];
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  networking.hostName = "nzxt";

  # drivers
  mynix.hardware.amdgpu.enable = true;

  # eye candy
  mynix.sddm_chili.enable = true;

  # WMs
  mynix.wm.qtile.enable = true;
  mynix.wm.hyprland.enable = true;

  services.hardware.openrgb.enable = true;

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

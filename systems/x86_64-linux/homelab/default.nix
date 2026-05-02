{ lib, ... }:
with lib;
with lib.mynix;
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "homelab";

  mynix = {
    services.openssh = enabled;

    system = {
      sound.enable = false;
      usb.enable = false;
      xkb.enable = false;
      fonts.enable = false;
      misc.enable = false;
    };

    services = {
      virt.enable = false;
      openvpn.enable = false;
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
  programs.nix-ld.enable = true;
  programs.nix-index-database.comma.enable = true;

  users.users.kraanzu = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    openssh.authorizedKeys.keys = [
      # TODO: paste your public key here, or load from a file
    ];
  };

  system.stateVersion = "24.11";
}

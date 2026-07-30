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
      boot.enable = false;
      sound.enable = false;
      usb.enable = false;
      xkb.enable = false;
      fonts.enable = false;
      misc.enable = false;
    };

    services = {
      jellyfin = enabled;
      virt.enable = false;
      openvpn.enable = false;
    };
  };

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

  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
  };

  system.stateVersion = "24.11";
}

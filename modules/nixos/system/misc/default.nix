{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mynix.system.misc;
in
{
  options.mynix.system.misc.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Setup misc items";
  };

  config = lib.mkIf cfg.enable {
    services.printing.enable = false;
    security.polkit.enable = true;
    networking.networkmanager.enable = true;

    programs.dconf.enable = true;
    programs.nix-index-database.comma.enable = true;
    programs.nix-ld.enable = true;
    environment.systemPackages = with pkgs; [
      android-tools
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
      ];
      config = {
        common.default = "*";
      };
    };

    services.dbus.enable = true;
    programs.seahorse.enable = true;
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };

    hardware.i2c.enable = true;
    systemd.settings.Manager.DefaultTimeoutStopSec = "5s";

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}

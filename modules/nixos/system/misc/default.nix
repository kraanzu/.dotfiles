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
    programs.adb.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config = {
        common.default = "*";
      };
    };

    services.dnsmasq.enable = true;
    services.dnsmasq.settings = {
      no-resolv = true;
      bogus-priv = true;
      strict-order = true;
      server = [
        "94.140.14.49"
        "94.140.15.15"
      ];
    };

    services.dbus.enable = true;
    programs.seahorse.enable = true;
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.sddm.enableGnomeKeyring = true;
    security.pam.services.login.enableGnomeKeyring = true;

    # Faster Load/Shutdown
    systemd.services."NetworkManager-wait-online".enable = false;
    systemd.extraConfig = ''
      DefaultTimeoutStopSec=5s
    '';

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}

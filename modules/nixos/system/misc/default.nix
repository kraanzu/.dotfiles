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

    environment.systemPackages = [ pkgs.keepassxc ];

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}

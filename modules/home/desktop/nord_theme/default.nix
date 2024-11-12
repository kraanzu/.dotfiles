{
  namespace,
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.desktop.nord_theme;
in {
  options.${namespace}.desktop.nord_theme.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable nord gtk theme";
  };

  config = lib.mkIf cfg.enable {
    gtk.enable = true;
    qt.enable = true;

    home.pointerCursor.gtk.enable = true;
    home.pointerCursor.name = "Nordic-cursors";
    home.pointerCursor.package = pkgs.nordic;

    gtk.theme.name = "Nordic-bluish-accent";
    gtk.theme.package = pkgs.nordic;

    gtk.iconTheme.name = "Papirus";
    gtk.iconTheme.package = pkgs.papirus-nord.override {accent = "polarnight2";};

    gtk.cursorTheme.name = "Nordic-cursors";
    gtk.cursorTheme.package = pkgs.nordic;
  };
}

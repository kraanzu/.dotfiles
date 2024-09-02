{pkgs, ...}: {
  gtk.enable = true;
  qt.enable = true;

  home.pointerCursor.gtk.enable = true;
  home.pointerCursor.name = "Nordic-cursors";
  home.pointerCursor.package = pkgs.nordic;

  gtk.theme.name = "Nordic-bluish-accent";
  gtk.theme.package = pkgs.nordic;

  gtk.iconTheme.name = "Nordic-darker";
  gtk.iconTheme.package = pkgs.nordic;

  gtk.cursorTheme.name = "Nordic-cursors";
  gtk.cursorTheme.package = pkgs.nordic;
}

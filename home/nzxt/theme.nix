{pkgs, ...}: {
  gtk.enable = true;
  qt.enable = true;

  gtk.theme.name = "Nordic-bluish-accent";
  gtk.theme.package = pkgs.nordic;

  gtk.iconTheme.name = "Nordic-darker";
  gtk.iconTheme.package = pkgs.nordic;

  gtk.cursorTheme.name = "Nordic-cursors";
  gtk.cursorTheme.package = pkgs.nordic;
}

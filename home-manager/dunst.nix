{
  # In your home.nix or wherever your Home Manager configuration resides
  home.file."dunst" = {
    source = ../configs/dunst;
    target = ".config/dunst"; # This is where you want to symlink it to
  };
}

{
  # In your home.nix or wherever your Home Manager configuration resides
  home.file."qtile_config" = {
    source = ../configs/qtile;
    target = ".config/qtile"; # This is where you want to symlink it to
  };
}

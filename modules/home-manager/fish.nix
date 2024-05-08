{
  # In your home.nix or wherever your Home Manager configuration resides
  home.file."fish_config" = {
    source = ../configs/fish;
    target = ".config/fish"; # This is where you want to symlink it to
  };
}

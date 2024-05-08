{
  # In your home.nix or wherever your Home Manager configuration resides
  home.file."nvim" = {
    source = ../configs/nvim;
    target = ".config/nvim"; # This is where you want to symlink it to
  };
}

{
  # In your home.nix or wherever your Home Manager configuration resides
  home.file."dooit" = {
    source = ../configs/starship.toml;
    target = ".config/starship.toml"; # This is where you want to symlink it to
  };
}

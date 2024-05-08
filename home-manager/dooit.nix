{
  # In your home.nix or wherever your Home Manager configuration resides
  home.file."dooit" = {
    source = ../configs/dooit;
    target = ".config/dooit"; # This is where you want to symlink it to
  };
}

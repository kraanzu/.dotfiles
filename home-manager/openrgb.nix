{
  # In your home.nix or wherever your Home Manager configuration resides
  home.file."OpenRGB" = {
    source = ../configs/OpenRGB;
    target = ".config/OpenRGB"; # This is where you want to symlink it to
  };
}

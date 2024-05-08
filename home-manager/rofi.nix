{
  # In your home.nix or wherever your Home Manager configuration resides
  home.file."rofi" = {
    source = ../configs/rofi;
    target = ".config/rofi"; # This is where you want to symlink it to
  };
}

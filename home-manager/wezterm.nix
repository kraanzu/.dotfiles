{
  # In your home.nix or wherever your Home Manager configuration resides
  home.file."wezterm_config" = {
    source = ../configs/wezterm;
    target = ".config/wezterm"; # This is where you want to symlink it to
  };
}

{
  programs.alacritty = {
    enable = true;
    settings = import ./alacritty_theme.nix;
  };
}

{pkgs, ...}: {
  programs.alacritty = {
    enable = pkgs.alacritty != null;
    settings = import ./alacritty_theme.nix;
  };
}

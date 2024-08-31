{
  home.file = {

    # All config files symlinked!

    "dooit" = {
      source = ../configs/dooit;
      target = ".config/dooit"; # This is where you want to symlink it to
    };

    "dunst" = {
      source = ../configs/dunst;
      target = ".config/dunst"; # This is where you want to symlink it to
    };

    "fish_config" = {
      source = ../configs/fish;
      target = ".config/fish"; # This is where you want to symlink it to
    };

    "nvim" = {
      source = ../configs/nvim;
      target = ".config/nvim"; # This is where you want to symlink it to
    };

    "OpenRGB" = {
      source = ../configs/OpenRGB;
      target = ".config/OpenRGB"; # This is where you want to symlink it to
      recursive = true;
    };

    "qtile_config" = {
      source = ../configs/qtile;
      target = ".config/qtile"; # This is where you want to symlink it to
    };

    "rofi" = {
      source = ../configs/rofi;
      target = ".config/rofi"; # This is where you want to symlink it to
    };

    "starship" = {
      source = ../configs/starship.toml;
      target = ".config/starship.toml"; # This is where you want to symlink it to
    };

    "wezterm" = {
      source = ../configs/wezterm;
      target = ".config/wezterm"; # This is where you want to symlink it to
    };
  };
}

{
  home.file = {
    # All config files symlinked!

    "dooit" = {
      source = ../../configs/dooit;
      target = ".config/dooit";
    };

    "dunst" = {
      source = ../../configs/dunst;
      target = ".config/dunst";
    };

    "fish" = {
      source = ../../configs/fish;
      target = ".config/fish";
    };

    "nvim" = {
      source = ../../configs/nvim;
      target = ".config/nvim";
      recursive = true;
    };

    "OpenRGB" = {
      source = ../../configs/OpenRGB;
      target = ".config/OpenRGB";
      recursive = true;
    };

    "qtile" = {
      source = ../../configs/qtile;
      target = ".config/qtile";
    };

    "rofi" = {
      source = ../../configs/rofi;
      target = ".config/rofi";
    };

    "starship" = {
      source = ../../configs/starship.toml;
      target = ".config/starship.toml";
    };

    "wezterm" = {
      source = ../../configs/wezterm;
      target = ".config/wezterm";
    };
  };
}

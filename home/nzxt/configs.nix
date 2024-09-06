{mysecrets, ...}: let
  secretspath = builtins.toString mysecrets;
  base_config = builtins.toString ../../configs;
in {
  home.file = {
    # All config files symlinked!

    "dooit" = {
      source = "${base_config}/dooit";
      target = ".config/dooit";
    };

    # "dunst" = {
    #   source = "${base_config}/dunst";
    #   target = ".config/dunst";
    # };

    "fish" = {
      source = "${base_config}/fish";
      target = ".config/fish";
      recursive = true;
    };

    "nvim" = {
      source = "${base_config}/nvim";
      target = ".config/nvim";
      recursive = true;
    };

    "OpenRGB" = {
      source = "${base_config}/OpenRGB";
      target = ".config/OpenRGB";
      recursive = true;
    };

    "qtile" = {
      source = "${base_config}/qtile";
      target = ".config/qtile";
    };

    # "rofi" = {
    #   source = "${base_config}/rofi";
    #   target = ".config/rofi";
    #   recursive = true;
    # };

    "starship" = {
      source = "${base_config}/starship.toml";
      target = ".config/starship.toml";
    };

    "wezterm" = {
      source = "${base_config}/wezterm";
      target = ".config/wezterm";
    };

    # Secrets
    "fish_secrets" = {
      source = "${secretspath}/secrets.fish";
      target = ".config/fish/secrets.fish";
      recursive = true;
    };

    "gdrive" = {
      source = "${secretspath}/gdrive";
      target = ".gdrive";
      recursive = true;
    };

    "textual-web" = {
      source = "${secretspath}/textual-web";
      target = ".config/textual-web";
      recursive = true;
    };
  };
}

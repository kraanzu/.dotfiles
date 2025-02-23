{
  inputs,
  namespace,
  ...
}: let
  secretspath = builtins.toString inputs.mysecrets;
  base_config = builtins.toString ./configs;
in {
  home.file = {
    # All config files symlinked!

    # "${namespace}.dooit" = {
    #   source = "${base_config}/dooit";
    #   target = ".config/dooit";
    # };

    "${namespace}.fish" = {
      source = "${base_config}/fish";
      target = ".config/fish";
      recursive = true;
    };

    "n${namespace}.vim" = {
      source = "${base_config}/nvim";
      target = ".config/nvim";
      recursive = true;
    };

    "${namespace}.qtile" = {
      source = "${base_config}/qtile";
      target = ".config/qtile";
    };

    "${namespace}.starship" = {
      source = "${base_config}/starship.toml";
      target = ".config/starship.toml";
    };

    "${namespace}.wezterm" = {
      source = "${base_config}/wezterm";
      target = ".config/wezterm";
    };

    # Secrets
    "${namespace}.fish_secrets" = {
      source = "${secretspath}/secrets.fish";
      target = ".config/fish/secrets.fish";
      recursive = true;
    };

    # "${namespace}.gdrive" = {
    #   source = "${secretspath}/gdrive";
    #   target = ".config/gdrive3";
    #   recursive = true;
    # };

    "${namespace}.textual-web" = {
      source = "${secretspath}/textual-web";
      target = ".config/textual-web";
      recursive = true;
    };

    "${namespace}.aws" = {
      source = "${secretspath}/aws";
      target = ".aws";
    };
  };
}

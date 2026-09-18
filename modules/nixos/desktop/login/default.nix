{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib;
let
  cfg = config.mynix.desktop.login;
  wallpath = toString inputs.mywalls;
in
{
  options.mynix.desktop.login.enable = lib.mkEnableOption "the SDDM login";

  config = mkIf cfg.enable {
    environment.sessionVariables = {
      QT_QPA_PLATFORMTHEME = "gtk3";
      # QT_STYLE_OVERRIDE = "gtk3";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };

    services.greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "start-hyprland";
          user = config.mynix.user.name;
        };
      };
    };

    services.displayManager.regreet = {
      enable = true;
      theme = {
        name = "Nordic";
        package = pkgs.nordic;
      };
      settings = {
        background = {
          path = "${wallpath}/blank.png";
          fit = "Cover";
        };
        GTK = {
          application_prefer_dark_theme = true;
          theme_name = "Nordic";
        };
      };
    };

  };
}

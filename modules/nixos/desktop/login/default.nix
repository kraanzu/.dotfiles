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
  wallpath = builtins.toString inputs.mywalls;
in
{
  options = {
    mynix.desktop.login.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the SDDM login";
    };
  };

  config = mkIf cfg.enable {

    services.greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "niri-session";
          user = "kraanzu";
        };
      };
    };

    programs.regreet = {
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

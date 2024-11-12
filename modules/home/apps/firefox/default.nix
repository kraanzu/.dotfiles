{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.firefox;
in {
  options.${namespace}.apps.firefox = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable firefox";
    };
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      profiles.kraanzu = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
          @import "${pkgs.${namespace}.firefox-nordic-theme}/userChrome.css";
        '';
      };
    };
  };
}

{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.mynix.apps.firefox;
in {
  options.mynix.apps.firefox = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable firefox";
    };
  };

  config = mkIf (cfg.enable && pkgs.stdenv.isLinux) {
    programs.firefox = {
      enable = true;
      profiles.kraanzu = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
          # @import "${pkgs.mynix.firefox-nordic-theme}/userChrome.css";
        '';
      };
    };
  };
}

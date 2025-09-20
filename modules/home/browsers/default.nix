{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
with lib.mynix;

let
  cfg = config.mynix.browsers;

  browserDesktopNames = {
    firefox = "firefox.desktop";
    brave = "brave-browser.desktop";
    chrome = "google-chrome.desktop";
  };

  defaultDesktop = browserDesktopNames.${cfg.defaultBrowser};
in
{
  options.mynix.browsers = {
    all.enable = mkBoolOpt false "Enable all browsers";
    firefox.enable = mkBoolOpt false "Enable Firefox browser";
    brave.enable = mkBoolOpt false "Enable Brave browser";
    chrome.enable = mkBoolOpt false "Enable Chrome browser";
    edge.enable = mkBoolOpt false "Enable MS Edge browser";

    defaultBrowser = mkOption {
      type = types.enum [
        "firefox"
        "brave"
        "chrome"
      ];
      default = "firefox";
      description = "Default browser for xdg-open";
    };
  };

  config = {
    home.packages = with pkgs; [
      (mkIf (cfg.brave.enable || cfg.all.enable) brave)
      (mkIf (cfg.chrome.enable || cfg.all.enable) google-chrome)
      (mkIf (cfg.edge.enable || cfg.all.enable) microsoft-edge)
    ];

    programs.firefox = mkIf (cfg.firefox.enable || cfg.all.enable) {
      enable = true;
      profiles.kraanzu = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
          tab.identity-color-yellow {
            color: white !important;
          }
          tab.identity-color-yellow .tab-background .tab-context-line {
            background-color: #EBCB8B !important;
            height: 6px !important;
            position: absolute !important;
            bottom: 0 !important;
            left: 0 !important;
            right: 0 !important;
          }
        '';
      };
    };

    xdg.mimeApps.defaultApplications = {
      "text/html" = [ defaultDesktop ];
      "x-scheme-handler/http" = [ defaultDesktop ];
      "x-scheme-handler/https" = [ defaultDesktop ];
      "x-scheme-handler/chrome" = [ defaultDesktop ];
      "application/x-extension-htm" = [ defaultDesktop ];
      "application/x-extension-html" = [ defaultDesktop ];
      "application/x-extension-shtml" = [ defaultDesktop ];
      "application/xhtml+xml" = [ defaultDesktop ];
      "application/x-extension-xhtml" = [ defaultDesktop ];
      "application/x-extension-xht" = [ defaultDesktop ];
    };

    home.sessionVariables.BROWSER = defaultDesktop;
  };
}

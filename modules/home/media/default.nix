{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
with lib.mynix;

let
  cfg = config.mynix.media;
in
{
  options.mynix.media = {
    all.enable = mkBoolOpt false "Enable all apps";
    anydesk.enable = mkBoolOpt false "Enable Anydesk";
    qbittorrent.enable = mkBoolOpt false "Enable qBittorrent";
    simplescreenrecorder.enable = mkBoolOpt false "Enable SimpleScreenRecorder";
    telegram.enable = mkBoolOpt false "Enable Telegram";
    vlc.enable = mkBoolOpt false "Enable VLC";
    discord.enable = mkBoolOpt false "Enable Discord";
  };

  config = {
    home.packages = with pkgs; [
      (mkIf (cfg.anydesk.enable || cfg.all.enable) anydesk)
      (mkIf (cfg.qbittorrent.enable || cfg.all.enable) qbittorrent)
      (mkIf (cfg.simplescreenrecorder.enable || cfg.all.enable) simplescreenrecorder)
      (mkIf (cfg.telegram.enable || cfg.all.enable) telegram-desktop)
      (mkIf (cfg.vlc.enable || cfg.all.enable) vlc)
      (mkIf (cfg.discord.enable || cfg.all.enable) discord)
    ];

    xdg.mimeApps.defaultApplications = mkIf (cfg.telegram.enable || cfg.all.enable) {
      "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];
    };
  };
}

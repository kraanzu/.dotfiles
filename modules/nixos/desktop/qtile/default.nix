{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
let
  cfg = config.mynix.desktop.qtile;
in
{
  options = {
    mynix.desktop.qtile.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Qtile WM";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
    environment.systemPackages = with pkgs; [
      pulseaudio
      playerctl
    ];

    services.xserver.windowManager.qtile = {
      enable = true;
      extraPackages =
        p: with p; [
          qtile-extras
          dbus-next
          pulsectl-asyncio
          requests
        ];
    };
  };
}

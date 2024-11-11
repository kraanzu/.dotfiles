{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.desktop.qtile;
in {
  options = {
    ${namespace}.desktop.qtile.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Qtile WM";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.gdk-pixbuf.modulePackages = [pkgs.librsvg];

    services.xserver.windowManager.qtile = {
      enable = true;
      extraPackages = p:
        with p; [
          qtile-extras
          dbus-next
          pulsectl-asyncio
          requests
        ];
    };
  };
}

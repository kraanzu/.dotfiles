{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mynix.wm.qtile.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Qtile WM";
    };
  };

  config = lib.mkIf config.mynix.wm.qtile.enable {
    mynix.services = {
      x11.enable = true;
      wayland.enable = true;
    };

    services.xserver.gdk-pixbuf.modulePackages = [ pkgs.librsvg ];

    environment.systemPackages = [
      pkgs.python312Packages.requests
      pkgs.librsvg
      pkgs.gdk-pixbuf.dev
    ];

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

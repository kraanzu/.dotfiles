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

    environment.systemPackages = [pkgs.python312Packages.requests];

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

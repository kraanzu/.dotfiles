{
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
    mynix.x11.enable = true;

    services.xserver.windowManager.qtile = {
      enable = true;
      backend = "x11";
      extraPackages = p:
        with p; [
          qtile-extras
          dbus-next
        ];
    };
  };
}

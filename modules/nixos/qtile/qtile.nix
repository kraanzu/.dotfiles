{
  config,
  lib,
  ...
}:
with lib;
{
  options = {
    mynix.wm.qtile.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Qtile WM";
    };
  };

  config = mkIf config.mynix.wm.qtile.enable {
    services.xserver.windowManager.qtile = {
      enable = true;
      backend = "x11";
      extraPackages = p: with p; [qtile-extras];
    };
  };
}

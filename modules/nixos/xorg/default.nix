{
  config,
  lib,
  ...
}:
with lib;
{
  options = {
    mynix.x11.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable XORG";
    };
  };

  config = mkIf config.mynix.x11.enable {
    services.xserver = {
      enable = true;
      xkb = {
        variant = "";
        layout = "us";
      };
    };

    services.picom = {
      enable = true;
      vSync = true;
    };
  };
}


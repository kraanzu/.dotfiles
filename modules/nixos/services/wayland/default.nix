{
  config,
  lib,
  ...
}:
with lib; {
  options = {
    mynix.services.wayland.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup Wayland";
    };
  };

  config =
    mkIf config.mynix.services.wayland.enable {
    };
}

{

  lib,
  config,
  ...
}:
let
  cfg = config.mynix.system.usb;
in
{
  options.mynix.system.usb.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Setup usb stuff";
  };

  config = lib.mkIf cfg.enable {
    services.gvfs.enable = true;
    services.udisks2.enable = true;
  };
}

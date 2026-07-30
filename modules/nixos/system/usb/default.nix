{

  lib,
  config,
  ...
}:
let
  cfg = config.mynix.system.usb;
in
{
  options.mynix.system.usb.enable = lib.mynix.mkBoolOpt true "Setup usb stuff";

  config = lib.mkIf cfg.enable {
    services.gvfs.enable = true;
    services.udisks2.enable = true;
  };
}

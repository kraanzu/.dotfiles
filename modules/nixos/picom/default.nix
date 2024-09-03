{
  config,
  lib,
  ...
}:
with lib; let
  picom_config = import ./picom.nix;
in {
  options = {
    mynix.picom.enable = mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable picom";
    };
  };

  config = mkIf config.mynix.picom.enable {
    services.picom = picom_config.services.picom;
  };
}

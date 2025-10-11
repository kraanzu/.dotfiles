{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.mynix.desktop.login;
in
{
  options = {
    mynix.desktop.login.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the SDDM login";
    };
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.displayManager.sddm = {
      enable = true;
    };
    services.getty.autologinUser = "kraanzu";
    services.displayManager.autoLogin = {
      enable = true;
      user = "kraanzu";
    };
  };
}

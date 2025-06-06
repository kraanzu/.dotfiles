{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.mynix.apps.zed;
in {
  options.mynix.apps.zed = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Zed Editor";
    };
  };

  config = mkIf cfg.enable {
    programs.zed-editor.enable = true;
    services.gnome-keyring = {
      enable = true;
      components = ["pkcs11" "secrets" "ssh"];
    };
  };
}

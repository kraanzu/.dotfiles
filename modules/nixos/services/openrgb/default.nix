{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.mynix.services.openrgb;
in {
  options.mynix.services.openrgb = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable OpenRGB with systemd service";
    };

    profile = mkOption {
      type = types.str;
      description = "Default profile to load on OpenRGB start";
    };
  };

  config = mkIf cfg.enable {
    services.hardware.openrgb.enable = true;

    systemd.user.services.openrgb = {
      description = "OpenRGB Server";
      serviceConfig = {
        ExecStart = "${pkgs.openrgb}/bin/openrgb --server --profile ${cfg.profile}";
        Restart = "on-failure";
      };
      wantedBy = ["default.target"];
    };
  };
}

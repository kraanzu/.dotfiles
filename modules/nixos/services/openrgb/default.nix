{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.openrgb;
in {
  options.services.openrgb.enable = mkOption {
    type = types.bool;
    default = true;
    description = "Enable OpenRGB with systemd service";
  };

  config = mkIf cfg.enable {
    services.hardware.openrgb.enable = true;

    systemd.user.services.openrgb = {
      description = "OpenRGB Server";
      serviceConfig = {
        ExecStart = "${pkgs.openrgb}/bin/openrgb --server --profile purple";
        Restart = "on-failure";
      };
      wantedBy = ["default.target"];
    };
  };
}

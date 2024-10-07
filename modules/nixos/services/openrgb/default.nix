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
    # services.hardware.openrgb.enable = true;
    environment.systemPackages = [pkgs.openrgb];
    services.udev.packages = [pkgs.openrgb];

    systemd.user.services.openrgb = {
      description = "OpenRGB Server";
      serviceConfig = {
        ExecStart = "${pkgs.openrgb}/bin/openrgb --server --server-port 6742 --profile ${cfg.profile}";
        Restart = "on-failure";
      };
      wantedBy = ["default.target"];
    };
  };
}

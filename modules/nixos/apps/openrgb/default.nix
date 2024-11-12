{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.openrgb;
in {
  options.${namespace}.apps.openrgb = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable OpenRGB with systemd service";
    };

    profile = mkOption {
      type = types.path;
      default = ./profile.orp; # Convert relative path to absolute
      description = "Profile to load on OpenRGB start";
    };
  };

  config = mkIf cfg.enable {
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

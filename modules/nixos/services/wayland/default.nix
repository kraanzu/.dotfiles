{
  pkgs,
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

  config = mkIf config.mynix.services.wayland.enable {
    programs.xwayland.enable = true;
    systemd.user.services.mako = {
      description = "Mako Notification Daemon";
      serviceConfig.ExecStart = "${pkgs.mako}/bin/mako";
      wantedBy = ["default.target"];
    };
  };
}

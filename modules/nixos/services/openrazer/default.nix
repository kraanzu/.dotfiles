{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.mynix;
let
  cfg = config.mynix.services.razer;
in
{
  options.mynix.services.razer = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable openrazer for mouse";
    };
  };
  config = mkIf cfg.enable {
    hardware.openrazer = enabled;
    users.users.kraanzu.extraGroups = [
      "plugdev"
      "openrazer"
    ];
    systemd.user.services.razer-battery = {
      description = "Razer mouse low-battery notifier";
      wantedBy = [ "default.target" ];
      path = [
        pkgs.gawk
        pkgs.libnotify
      ];
      serviceConfig.Type = "oneshot";
      script = ''
        for f in /sys/bus/hid/drivers/razermouse/*/charge_level; do
          [ -e "$f" ] || continue
          raw=$(cat "$f")
          [ "$raw" -eq 0 ] && continue
          pct=$(awk "BEGIN{printf \"%.1f\", $raw*100/255}")
          if awk "BEGIN{exit !($raw*100/255 < 10)}"; then
            notify-send -u critical \
              "Razer mouse battery low" "$pct% remaining"
          fi
        done
      '';
    };
  };
}

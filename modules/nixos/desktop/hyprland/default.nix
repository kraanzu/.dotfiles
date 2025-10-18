{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mynix.desktop.hyprland;
in
{
  options = {
    mynix.desktop.hyprland.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable hyprland WM";
    };
  };

  config = lib.mkIf cfg.enable {
    mynix.desktop.login.enable = true;
    programs.hyprland.enable = true;
    programs.waybar.enable = true;
    environment.systemPackages = with pkgs; [
      hyprlock
      hypridle
      hyprpaper
      wlsunset
      xwayland-satellite
      cliphist
      wl-clipboard
      grim
      swappy
      slurp
    ];
  };
}

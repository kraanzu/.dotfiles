{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mynix.desktop.niri;
in
{
  options = {
    mynix.desktop.niri.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable niri WM";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.niri.enable = true;
    programs.waybar.enable = true;
    environment.systemPackages = with pkgs; [
      swaybg
      wlsunset
      xwayland-satellite
      cliphist
      wl-clipboard
    ];
  };
}

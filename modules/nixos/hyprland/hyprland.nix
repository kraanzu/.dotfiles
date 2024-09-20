{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mynix.wm.hyprland.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Hyprland WM";
    };
  };

  config = lib.mkIf config.mynix.wm.hyprland.enable {
    environment.systemPackages = [pkgs.kitty];
    programs.hyprland.enable = true;
  };
}

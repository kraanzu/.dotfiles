{
  inputs,
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
    # overlay to include in pkgs
    nixpkgs.overlays = [
      inputs.hyprpanel.overlay
    ];

    programs.hyprland.enable = true;
    environment.systemPackages = with pkgs; [kitty hyprpanel];
  };
}

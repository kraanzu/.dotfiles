{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.zoom;
in
{
  options.mynix.apps.zoom = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable zoom";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      zoom-us
    ];
  };
}

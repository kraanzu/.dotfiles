{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.zoom;
in {
  options.${namespace}.apps.zoom = {
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

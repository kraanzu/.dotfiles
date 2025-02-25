{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.zed;
in {
  options.${namespace}.apps.zed = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable zed editor";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.zed-editor];
  };
}

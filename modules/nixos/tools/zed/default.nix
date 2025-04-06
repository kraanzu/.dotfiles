{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.mynix.tools.zed;
in {
  options.mynix.tools.zed = {
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

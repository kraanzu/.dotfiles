{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.tools.zed;
in {
  options.${namespace}.tools.zed = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable zed editor";
    };
  };

  config = mkIf cfg.enable {
    homebrew.casks = [ "zed" ];
  };
}

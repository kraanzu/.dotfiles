{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.anydesk;
in {
  options.${namespace}.apps.anydesk = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable anydesk";
    };
  };

  config = mkIf cfg.enable {
    homebrew.casks = [ "anydesk" ];
  };
}

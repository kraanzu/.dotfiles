{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.mynix.apps.anydesk;
in {
  options.mynix.apps.anydesk = {
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

{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.anydesk;
in
{
  options.mynix.apps.anydesk = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable anydesk";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.anydesk ];
  };
}

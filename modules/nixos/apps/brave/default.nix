{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.brave;
in
{
  options.mynix.apps.brave = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable brave";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.brave ];
  };
}

{
  config,
  lib,
  pkgs,

  ...
}:
with lib;
let
  cfg = config.mynix.apps.postman;
in
{
  options.mynix.apps.postman = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Postman";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.postman ];
  };
}

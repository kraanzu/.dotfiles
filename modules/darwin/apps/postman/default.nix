{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.postman;
in {
  options.${namespace}.apps.postman = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Postman";
    };
  };

  config = mkIf cfg.enable {
    homebrew.casks = [ "postman" ];
  };
}

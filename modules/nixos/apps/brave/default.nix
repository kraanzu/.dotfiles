{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.brave;
in {
  options.${namespace}.apps.brave = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable brave";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.brave];
  };
}

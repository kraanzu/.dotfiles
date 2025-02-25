{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.apps.soptify;
in {
  options.${namespace}.apps.soptify = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable soptify";
    };
  };

  environment.systemPackages = with pkgs; [
    soptify
  ];
}

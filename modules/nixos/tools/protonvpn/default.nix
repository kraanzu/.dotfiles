{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.tools.protonvpn;
in {
  options = {
    ${namespace}.tools.protonvpn.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Protonvpn";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      protonvpn-cli_2
    ];
  };
}

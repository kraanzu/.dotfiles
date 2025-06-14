{
  pkgs,
  lib,
  config,

  ...
}:
let
  cfg = config.mynix.cli.protonvpn;
in
{
  options = {
    mynix.cli.protonvpn.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Protonvpn";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      protonvpn-cli_2
    ];
  };
}

{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.mynix.cli.git-crypt;
in {
  options = {
    mynix.cli.git-crypt.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable git-crypt";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      git-crypt
    ];
  };
}

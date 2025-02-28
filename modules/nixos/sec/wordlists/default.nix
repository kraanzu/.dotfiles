{
  pkgs,
  config,
  namespace,
  lib,
  ...
}: let
  cfg = config.${namespace}.sec.wordlists;
in {
  options = {
    ${namespace}.sec.wordlists.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Setup wordlists";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.wordlists];
    systemd.tmpfiles.settings = {
      "wordlists" = {
        "/sec/wordlists" = {
          L = {
            argument = "${pkgs.wordlists}/share/wordlists";
          };
        };
      };
    };
  };
}

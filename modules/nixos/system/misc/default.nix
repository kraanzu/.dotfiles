{
  namespace,
  lib,
  config,
  ...
}: let
  cfg = config.${namespace}.system.misc;
in {
  options.${namespace}.system.misc.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Setup misc items";
  };

  config = lib.mkIf cfg.enable {
    services.printing.enable = false;
    security.polkit.enable = true;
    networking.networkmanager.enable = true;

    programs.dconf.enable = true;
    programs.nix-index-database.comma.enable = true;
    programs.nix-ld.enable = true;

    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
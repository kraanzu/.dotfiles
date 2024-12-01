{
  pkgs,
  namespace,
  lib,
  config,
  ...
}: let
  cfg = config.${namespace}.system.fonts;
in {
  options.${namespace}.system.fonts.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Setup fonts";
  };

  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [nerd-fonts.sauce-code-pro];
  };
}

{
  inputs,
  namespace,
  config,
  lib,
  ...
}: let
  wallpath = builtins.toString inputs.mywalls;
  cfg = config.${namespace}.desktop.wallpapers;
in {
  options.${namespace}.desktop.wallpapers.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable desktop wallpapers";
  };

  config = lib.mkIf cfg.enable {
    home.file = {
      "wallpapers" = {
        source = "${wallpath}";
        target = ".wallpapers";
      };
    };
  };
}

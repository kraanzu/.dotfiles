{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.markdown;
in
{
  options = {
    mynix.dev.markdown.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup markdown stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      marksman
    ];
  };
}

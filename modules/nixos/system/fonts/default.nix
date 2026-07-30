{
  pkgs,

  lib,
  config,
  ...
}:
let
  cfg = config.mynix.system.fonts;
in
{
  options.mynix.system.fonts.enable = lib.mynix.mkBoolOpt true "Setup fonts";

  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.sauce-code-pro
      nerd-fonts.jetbrains-mono
      font-awesome
    ];
  };
}

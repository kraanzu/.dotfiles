{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.python;
in
{
  options = {
    mynix.dev.python.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup python stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      python3
      pyright
      ruff
      poetry
      uv
      python312Packages.ipython
      binutils # pyinstaller requirement
    ];
  };
}

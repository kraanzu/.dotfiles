{
  pkgs,
  config,
  lib,

  ...
}:
let
  cfg = config.mynix.dev.lang.python;
in
{
  options = {
    mynix.dev.lang.python.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup python stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # lang
      python3

      # lsp
      pylyzer
      pyright

      # formatters
      ruff

      # package managers
      poetry
      uv

      # repl
      python312Packages.ipython

      # pyinstaller requirement
      binutils
    ];
  };
}

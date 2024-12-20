{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.lang.python;
in {
  options = {
    ${namespace}.dev.lang.python.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup python stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
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

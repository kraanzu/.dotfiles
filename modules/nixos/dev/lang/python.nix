{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mynix.dev.lang.python.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Setup python stuff";
    };
  };

  config = lib.mkIf config.mynix.dev.lang.python.enable {
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
    ];
  };
}

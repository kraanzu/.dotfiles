{
  namespace,
  lib,
  config,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.suites.development;
in {
  options.${namespace}.suites.development.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Development Config";
  };

  config = mkIf cfg.enable {
    mynix = {
      dev.lang = {
        python = enabled;
        nix = enabled;
        lua = enabled;
        markdown = enabled;
      };
      tools = {
        wezterm = enabled;

        docker = enabled;

        neovim = enabled;
        vscode = enabled;
        code-cursor = enabled;
      };
    };
  };
}

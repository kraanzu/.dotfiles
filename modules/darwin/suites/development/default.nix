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
    ${namespace} = {
      dev = {
        python = enabled;
        nix = enabled;
        lua = enabled;
        markdown = enabled;
      };
      apps = {
        postman = enabled;
        wezterm = enabled;
        vscode = enabled;
        code-cursor = enabled;
        zed = enabled;
      };
    };
  };
}

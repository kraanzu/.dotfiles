{

  lib,
  config,
  ...
}:
with lib;
with lib.mynix;
let
  cfg = config.mynix.suites.development;
in
{
  options.mynix.suites.development.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Development Config";
  };

  config = mkIf cfg.enable {
    mynix = {
      dev = {
        cpp = enabled;
        python = enabled;
        nix = enabled;
        lua = enabled;
        markdown = enabled;
        ts = enabled;
        go = enabled;
      };
      apps = {
        zed = enabled;
        neovim = enabled;
        vscode = enabled;
        code-cursor = enabled;
        wezterm = enabled;
        postman = enabled;
      };
    };
  };
}

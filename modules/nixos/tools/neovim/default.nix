{
  pkgs,
  lib,
  config,
  namespace,
  ...
}: let
  cfg = config.${namespace}.tools.neovim;
in {
  options = {
    ${namespace}.tools.neovim.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Neovim";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wezterm # terminal
      neovim

      python312Packages.debugpy # python dap
      nodejs_22 # copilot
      ctags # toggle bar
      gcc # Treesiter
    ];
  };
}

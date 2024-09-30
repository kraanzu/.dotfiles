{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mynix.dev.tools.neovim.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Setup neovim stuff";
    };
  };

  config = lib.mkIf config.mynix.dev.tools.neovim.enable {
    environment.systemPackages = with pkgs; [
      # dev tools
      neovim
      nodejs_22 # neovim copilot
      ctags # toggle bar
    ];
  };
}

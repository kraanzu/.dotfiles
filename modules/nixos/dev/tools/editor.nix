{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.mynix.dev.tools.neovim.enable {
    environment.systemPackages = with pkgs; [
      # dev tools
      neovim
      vscode
    ];
  };
}

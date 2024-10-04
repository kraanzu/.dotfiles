{
  pkgs,
  ...
}: {
  config = {
    environment.systemPackages = with pkgs; [
      # dev tools
      neovim
      vscode
      # code-cursor
    ];
  };
}

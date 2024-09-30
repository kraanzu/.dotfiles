{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # terminals
    wezterm
    alacritty

    # LANG
    nodejs_22 # neovim copilot

    # LSP
    marksman

    # runners
    gnumake # make
    gcc # rust linker issue + CP

    # extras
    binutils # for binary packaging
    ctags

    # dev tools
    neovim
    vscode
  ];
}

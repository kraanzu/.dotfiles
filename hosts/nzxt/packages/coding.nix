{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # terminals
    wezterm
    alacritty

    # LANG
    python3
    zig
    lua
    nodejs_22 # neovim copilot
    go

    # LSP
    pyright
    zls
    luajitPackages.lua-lsp
    marksman
    gopls
    nixd

    # FORMATTER
    ruff
    alejandra
    stylua

    # runners
    gcc # rust linker issue + CP
    rustup
    uv
    poetry
    python311Packages.pip

    # extras
    binutils # for binary packaging

    # dev tools
    neovim
    vscode
  ];
}

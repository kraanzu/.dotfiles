{pkgs, pkgs-unstable, ...}: {
    environment.systemPackages = (with pkgs; [

    # terminals
    wezterm

    # LANG
    python3
    zig
    lua

    # LSP
    pyright
    zls
    luajitPackages.lua-lsp

    # FORMATTER
    black
    alejandra
    stylua

    # extras
    poetry
    python311Packages.pip
  ])

  ++

  (with pkgs-unstable; [
    neovim
    vscode
  ]);
}

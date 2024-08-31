{pkgs, ...}: {
    environment.systemPackages = with pkgs; [

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
    # stylua

  ];
}

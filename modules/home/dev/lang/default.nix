{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.mynix;

let
  cfg = config.mynix.dev.lang;
  languagePackages = {

    cpp = with pkgs; [
      gcc
    ];

    go = with pkgs; [
      go
      gopls
      delve
      gdlv
    ];

    python = with pkgs; [
      python3
      pyright
      ruff
      conda
      poetry
      uv
      python312Packages.ipython
      binutils
    ];

    haskell = with pkgs; [
      ghc
      cabal-install
      haskell-language-server
      fourmolu
      hlint
    ];

    lua = with pkgs; [
      lua
      luajitPackages.lua-lsp
    ];

    markdown = with pkgs; [
      marksman
    ];

    nix = with pkgs; [
      nixd
      nixfmt-rfc-style
    ];

    rust = with pkgs; [
      rustup
    ];

    ts = with pkgs; [
      nodejs_22
      typescript
    ];

    zig = with pkgs; [
      zig
      zls
    ];

  };

  enabledLanguages = filterAttrs (name: _: cfg.${name}.enable) languagePackages;
  allEnabledPackages = concatLists (attrValues enabledLanguages);
in
{
  options.mynix.dev.lang = {
    cpp.enable = mkBoolOpt false "Enable C++";
    go.enable = mkBoolOpt false "Enable Go";
    python.enable = mkBoolOpt false "Enable Python";
    haskell.enable = mkBoolOpt false "Enable Haskell";
    lua.enable = mkBoolOpt false "Enable Lua";
    markdown.enable = mkBoolOpt false "Enable Markdown";
    nix.enable = mkBoolOpt false "Enable Nix";
    rust.enable = mkBoolOpt false "Enable Rust";
    ts.enable = mkBoolOpt false "Enable TypeScript";
    zig.enable = mkBoolOpt false "Enable Zig";
  };

  config = {
    home.packages = with pkgs; allEnabledPackages ++ [ entr ];
  };
}

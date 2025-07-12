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
    cpp.enable = mkBoolOpt false "Enable C++ development environment";
    go.enable = mkBoolOpt false "Enable Go development environment";
    python.enable = mkBoolOpt false "Enable Python development environment";
    lua.enable = mkBoolOpt false "Enable Lua development environment";
    markdown.enable = mkBoolOpt false "Enable Markdown tools";
    nix.enable = mkBoolOpt false "Enable Nix development environment";
    rust.enable = mkBoolOpt false "Enable Rust development environment";
    ts.enable = mkBoolOpt false "Enable TypeScript development environment";
    zig.enable = mkBoolOpt false "Enable Zig development environment";
  };

  config = {
    home.packages = with pkgs; allEnabledPackages ++ [ entr ];
  };
}

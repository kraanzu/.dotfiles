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
      clang-tools
    ];

    go = with pkgs; [
      go
      gopls
      delve
      gdlv
    ];

    python = with pkgs; [
      python3
      basedpyright
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
      nil
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
    lua.enable = mkBoolOpt false "Enable Lua";
    markdown.enable = mkBoolOpt false "Enable Markdown";
    nix.enable = mkBoolOpt false "Enable Nix";
    rust.enable = mkBoolOpt false "Enable Rust";
    ts.enable = mkBoolOpt false "Enable TypeScript";
    zig.enable = mkBoolOpt false "Enable Zig";
  };

  config = {
    home.packages = allEnabledPackages;
  };
}

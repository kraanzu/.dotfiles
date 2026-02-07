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

    bash = with pkgs; [
      bash
      bash-language-server
      shfmt
    ];

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
      poetry
      uv
      python312Packages.ipython
      binutils
    ];

    lua = with pkgs; [
      lua
      luajitPackages.lua-lsp
      stylua
    ];

    markdown = with pkgs; [
      marksman
      prettier
    ];

    nix = with pkgs; [
      nil
      nixd
      nixfmt
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
    go.enable = mkBoolOpt true "Enable Go";
    python.enable = mkBoolOpt true "Enable Python";
    lua.enable = mkBoolOpt true "Enable Lua";
    markdown.enable = mkBoolOpt true "Enable Markdown";
    nix.enable = mkBoolOpt true "Enable Nix";
    bash.enable = mkBoolOpt true "Enable Bash";

    cpp.enable = mkBoolOpt false "Enable C++";
    rust.enable = mkBoolOpt false "Enable Rust";
    ts.enable = mkBoolOpt false "Enable TypeScript";
    zig.enable = mkBoolOpt false "Enable Zig";
  };

  config = {
    home.packages = allEnabledPackages;
  };
}

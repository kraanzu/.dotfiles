{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.mynix;
let
  cfg = config.mynix.dev.apps;
in
{
  options.mynix.dev.apps = {
    all.enable = mkBoolOpt false "Enable all editors";
    alacritty.enable = mkBoolOpt false "Enable Alacritty";
    wezterm.enable = mkBoolOpt false "Enable WezTerm";
    neovim.enable = mkBoolOpt false "Enable Neovim";
    postman.enable = mkBoolOpt false "Enable Postman";
    vscode.enable = mkBoolOpt false "Enable VSCode";
    cursor.enable = mkBoolOpt false "Enable Cursor";
    zed.enable = mkBoolOpt false "Enable Zed";
  };
  config = mkMerge [
    {
      home.packages = with pkgs; [
        (mkIf (cfg.alacritty.enable || cfg.all.enable) alacritty)
        (mkIf (cfg.postman.enable || cfg.all.enable) postman)
        (mkIf (cfg.vscode.enable || cfg.all.enable) vscode)
        (mkIf (cfg.cursor.enable || cfg.all.enable) code-cursor)
        (mkIf (cfg.wezterm.enable || cfg.all.enable) wezterm)
        (mkIf (cfg.zed.enable || cfg.all.enable) zed-editor)
      ];
    }
    (mkIf (cfg.neovim.enable || cfg.all.enable) {
      programs.nixvim = {
        enable = true;
        imports = [ ../nixvim/config.nix ];
      };
    })
  ];
}
